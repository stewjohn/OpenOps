class Instance < ActiveRecord::Base
  belongs_to :aws_account, primary_key: 'account_number', foreign_key: 'owner_id'
  has_many :instance_tags, primary_key: 'instance_id', foreign_key: 'instance_id'
  has_one :aws_vpc, primary_key: 'vpc_id', foreign_key: 'vpc_id'
  has_one :aws_region, through: :aws_vpc
  has_many :instance_block_device_mappings, primary_key: 'instance_id', foreign_key: 'instance_id'
  has_one :aws_key_pair, primary_key: "key_name", foreign_key: 'key_name'
  has_many :instance_security_group_mappings, primary_key: 'instance_id', foreign_key: 'instance_id'
  
  
  
  
  validates :instance_id, :state, :instance_type, :launch_time,
            :architecture, :root_device_type, :root_device_name,
            :virtualization_type, :client_token, :hypervisor, presence: true


  def self.with_map
	self.joins(:instance_block_device_mappings)
  end

  def self.volumes(instance_id) 
      vols = Array.new 
      Instance.with_map.find_by_instance_id(instance_id).instance_block_device_mappings.select(:volume_id){|m|  vols.push m.volume_id}
      return vols 
  end

  def self.create_instance(account_id,az,size,key,security_group,subnet_id, priv_ip)
	region = az.chop
	puts region
	ec2 = setup_ec2(account_id,region)
	resp = ec2.run_instances(
	  # required
	  image_id: "ami-bc8d18d4",
	  # required
	  min_count: 1,
	  # required
	  max_count: 1,
	  key_name: key,
	  security_group_ids: ["#{security_group}"],
	  instance_type: size,
	  monitoring: {
		# required
		enabled: true,
	  },
	  subnet_id: subnet_id,
	  disable_api_termination: false,
	  instance_initiated_shutdown_behavior: "stop",
	  private_ip_address: priv_ip
	)
  end
  
  
  
  def self.reboot(instance_id)
	  instance = Instance.joins(:aws_account,:aws_region).find_by_instance_id(instance_id)
	  ec2 = setup_ec2(instance.aws_account.id, instance.aws_region.name)
	  ec2.reboot_instances(instance_ids: ["#{instance_id}"])
  end
  
  
  
  

  def self.add_update_tag(instance, key, value) 
    instance = Instance.joins(:aws_account,:aws_region).find_by_instance_id(instance)
	creds = Aws::Credentials.new(instance.aws_account.access_key_id, instance.aws_account.secrete_access_key)
	ec2 = Aws::EC2::Client.new(region: instance.aws_region.name, credentials: creds, http_proxy: PROXY)
	ec2.create_tags(resources: ["#{instance.instance_id}"], tags: [{key: "#{key}", value: "#{value}"}])
  end 

  def self.update_volume_tags(instance_id, key, value)
        instance = Instance.joins(:aws_account,:aws_region).find_by_instance_id(instance_id)
	vols = Instance.volumes(instance_id)
        creds = Aws::Credentials.new(instance.aws_account.access_key_id, instance.aws_account.secrete_access_key)
        ec2 = Aws::EC2::Client.new(region: instance.aws_region.name, credentials: creds, http_proxy: PROXY)
        ec2.create_tags(resources: vols, tags: [{key: "#{key}", value: "#{value}"}])

  end 



  def self.update_instances
    AwsAccount.all.each do |account|
      AwsRegion.all.each do |aws_region |
        creds = Aws::Credentials.new(account.access_key_id, account.secrete_access_key)
        ec2 = Aws::EC2::Client.new(region: aws_region.name, credentials: creds, http_proxy: PROXY)
        ec2.describe_instances.reservations.each do | reservation |
          instances = reservation.instances.first
          saved_instance = Instance.where(instance_id: instances.instance_id).first_or_initialize
          saved_instance.owner_id = reservation.owner_id
          saved_instance.state_code = instances.state.code
          saved_instance.state = instances.state.name
          saved_instance.key_name = instances.key_name
          saved_instance.monitoring = instances.monitoring.state
          saved_instance.instance_type = instances.instance_type
          saved_instance.availability_zone = instances.placement.availability_zone
          saved_instance.group = instances.placement.group_name
          saved_instance.tenancy = instances.placement.tenancy
          saved_instance.launch_time = instances.launch_time
          saved_instance.subnet_id = instances.subnet_id
          saved_instance.vpc_id = instances.vpc_id
          saved_instance.private_ip_address = instances.private_ip_address
          saved_instance.public_ip_address = instances.public_ip_address
          saved_instance.architecture = instances.architecture
          saved_instance.root_device_type = instances.root_device_type
          saved_instance.root_device_name = instances.root_device_name
          saved_instance.virtualization_type = instances.virtualization_type
          saved_instance.client_token = instances.client_token
          saved_instance.source_dest_check = instances.source_dest_check
          saved_instance.hypervisor = instances.hypervisor
          saved_instance.ebs_optimized = instances.ebs_optimized
          saved_instance.save
          puts saved_instance.errors.messages
          #
          # Update TAGS
          tag_array = Array.new
          instances.tags.each do |tag|
            save_tag = InstanceTag.where(instance_id: instances.instance_id, name: tag.key).first_or_initialize
            save_tag.value = tag.value
            save_tag.save
            tag_array.push tag.key
          end
          InstanceTag.where(instance_id: instances.instance_id).where.not(name: tag_array).delete_all
          #
          # update Blockmapping
          block_array = Array.new
          instances.block_device_mappings.each do |map|
            block_map = InstanceBlockDeviceMapping.where(instance_id: instances.instance_id, device_name: map.device_name).first_or_initialize
            block_map.volume_id = map.ebs.volume_id
            block_map.save
            block_array.push map.device_name
          end
          InstanceBlockDeviceMapping.where(instance_id: instances.instance_id).where.not(device_name: block_array).delete_all
          #
          # Update ENI MAPS
          eni_array = Array.new
          instances.network_interfaces.each do |eni|
            eni_map = InstanceEniMapping.where(instance_id: instances.instance_id, network_interface_id: eni.network_interface_id).first_or_initialize
            eni_map.save
            eni_array.push eni.network_interface_id
          end
          InstanceEniMapping.where(instance_id: instances.instance_id).where.not(network_interface_id: eni_array).delete_all

		  #
          # Update SG MAPS
          sg_array = Array.new
          instances.security_groups.each do |sg|
            sg_map = InstanceSecurityGroupMapping.where(instance_id: instances.instance_id, group_id: sg.group_id).first_or_initialize
            sg_map.save
            sg_array.push sg.group_id
			
          end
          InstanceSecurityGroupMapping.where(instance_id: instances.instance_id).where.not(group_id: sg_array).delete_all

		  
        end
      end
    end
  end

end

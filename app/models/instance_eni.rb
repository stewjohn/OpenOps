class InstanceEni < ActiveRecord::Base

  def self.update_eni
    AwsAccount.all.each do |account|
      AwsRegion.all.each do |aws_region |
        creds = Aws::Credentials.new(account.access_key_id, account.secrete_access_key)
        ec2 = Aws::EC2::Client.new(region: aws_region.name, credentials: creds, http_proxy: PROXY)
        ec2.describe_network_interfaces.network_interfaces.each do |eni|
          eni_save = InstanceEni.where(network_interface_id: eni.network_interface_id).first_or_initialize
          unless eni.attachment.nil?
            eni_save.instance_id = eni.attachment.instance_id
            eni_save.attachment_id = eni.attachment.attachment_id
            eni_save.attach_date_time = eni.attachment.attach_time
          end
          eni_save.subnet_id = eni.subnet_id
          eni_save.vpc_id = eni.vpc_id
          eni_save.owner_id = eni.owner_id
          eni_save.status = eni.status
          eni_save.mac_address = eni.mac_address
          eni_save.source_dest_check = eni.source_dest_check
          eni_save.private_ip_address = eni.private_ip_address
          eni_save.private_dns_name = eni.private_dns_name
          unless eni.association.nil?
            eni_save.public_ip = eni.association.public_ip
            eni_save.public_dns_name = eni.association.public_dns_name
          end
          eni_save.save

          #
          #UPDATE ENI TAGS
          tag_array = Array.new
          eni.tag_set.each do |tag|
            save_tag = InstanceEniTag.where(network_interface_id: eni.network_interface_id, key: tag.key).first_or_initialize
            save_tag.value = tag.value
            save_tag.save
            tag_array.push tag.key
          end
          InstanceEniTag.where(network_interface_id: eni.network_interface_id).where.not(key: tag_array).first_or_initialize
        end
      end
    end

  end


end

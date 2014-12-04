class Environment < ActiveRecord::Base
  belongs_to :aws_account, primary_key: 'account_number'
  has_many :aws_vpcs, through: :aws_account
  belongs_to :checkpoint_frequency
  has_many :hosts 
  has_many :instances, through: :hosts
  def self.with_vpcs
    self.includes(:aws_vpcs)
  end

  def self.with_all
    self.joins(:aws_account,:checkpoint_frequency,:hosts,:instances)
  end
  
  def self.run_backups   
		CheckpointFrequency.all.each do |check|
			env = self.with_all.where(checkpoint_frequency_id: check.id).where("hosts.last_checkpoint < '#{Time.now.utc - check.hours_apart.hours}'")
			env.each do |enviroment|
				enviroment.hosts.each do |host| 
					EbsVolume.create_snaps(host.id)

				end
			end
		end
		
		env = self.with_all.where(dr_enabled: true) 
		env.each do |envir|
			envir.hosts.each  do | host |
					Host.dr_replicate(host.id)
			end
		end
	
	 
  end
	




end

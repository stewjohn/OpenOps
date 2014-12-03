class Environment < ActiveRecord::Base
  belongs_to :aws_account, primary_key: 'account_number'
  has_many :aws_vpcs, through: :aws_account
  belongs_to :checkpoint_fequency

  def self.with_vpcs
    self.includes(:aws_vpcs)
  end

  def self.with_all
    self.includes(:aws_account,:aws_vpcs,:checkpoint_fequency)
  end

end

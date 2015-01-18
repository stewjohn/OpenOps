class Sysid < ActiveRecord::Base
  has_many :hosts, through: :environments
  has_many :environments
end

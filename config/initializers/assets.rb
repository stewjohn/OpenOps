# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )
PROXY = "https://proxy:8080"

def setup_creds(cred_account)
  @account = AwsAccount.find(cred_account)
  creds = Aws::Credentials.new(@account.access_key_id, @account.secrete_access_key)
end 

def setup_ec2(account=1, region="us-east-1")
  creds =  setup_creds(account) 
  return Aws::EC2::Client.new(region: region, credentials: creds, http_proxy: PROXY)
end

def setup_cw(account=1, region="us-east-1")
  creds =  setup_creds(account) 
  return Aws::CloudWatch::Client.new(region:  region, credentials: creds, http_proxy: PROXY)
end 

PROXY = "https://proxy:8080"

def setup_creds(cred_account)
  @account = AwsAccount.find(cred_account)
  creds = Aws::Credentials.new(@account.access_key_id, @account.secrete_access_key)
end 

def setup_ec2(account=1, region="us-east-1")
  creds =  setup_creds(account) 
  return Aws::EC2::Client.new(region: region, credentials: creds, http_proxy: PROXY)
end

def setup_ec2_resource(account=1, region="us-east-1")
  creds =  setup_creds(account) 
  return Aws::EC2::Client.new(region: region, credentials: creds, http_proxy: PROXY)
end



def setup_cw(account=1, region="us-east-1")
  creds =  setup_creds(account) 
  return Aws::CloudWatch::Client.new(region:  region, credentials: creds, http_proxy: PROXY)
end 

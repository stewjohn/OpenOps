# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )
PROXY = "https://proxy:8080"


def setup_test
  @account = AwsAccount.find(1)
  creds = Aws::Credentials.new(@account.access_key_id, @account.secrete_access_key)
  return Aws::EC2::Client.new(region: "us-east-1", credentials: creds, http_proxy: PROXY)
end

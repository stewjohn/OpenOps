def setup_chef
	chef = Ridley.new( 
		server_url: "https://172.29.238.110/",
		client_name: 'workstation',
		client_key: '/openops/chef/workstation.pem',
		validator_client: "chef-validator",
		validator_path: "/openops/chef/chef-validator.pem",
		ssl: {verify: false}
	)
	return chef 
end
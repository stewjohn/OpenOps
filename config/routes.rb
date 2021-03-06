Rails.application.routes.draw do

  get "/hosts/:id/snapshot", to: 'hosts#snapshot', as: 'snapshot'
  get '/hosts/:id/replace_instance', to: 'hosts#replace_instance', as: 'replace'
  get '/hosts/:id/reboot', to: 'hosts#reboot', as: 'reboot'

  resources :instance_security_group_mappings
  resources :aws_security_group_tags
  resources :aws_security_group_ranges
  resources :aws_security_group_pairs
  resources :aws_security_group_egresses
  resources :aws_security_group_ingresses
  resources :aws_security_groups
  resources :aws_route_table_propogates
  resources :aws_route_table_associations
  resources :aws_route_table_tags
  resources :aws_route_table_routes
  resources :aws_route_tables
  resources :aws_network_acl_tags
  resources :aws_network_acl_entries
  resources :aws_network_acls
  resources :aws_key_pairs
  resources :aws_internet_gateway_tags
  resources :aws_internet_gateways
  resources :aws_dhcp_option_attributes
  resources :aws_dhcp_options
  resources :aws_elastic_ips
  resources :aws_account_attributes
  resources :checkpoint_frequencies
  resources :sysids
  resources :ebs_snapshot_tags
  resources :ebs_snapshots
  resources :ebs_volumes
  resources :ebs_volume_tags
  resources :instance_eni_tags
  resources :instance_eni_mappings
  resources :instance_tags
  resources :instance_block_device_mappings
  resources :aws_subnets
  resources :aws_vpc_tags
  resources :aws_vpcs
  resources :instance_enis
  resources :instances
  resources :host_states
  resources :hosts
  resources :aws_azs
  resources :aws_regions
  resources :environments

  resources :aws_accounts

  resources :indices

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root to: 'indices#index', :as => "root"

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end

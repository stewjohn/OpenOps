require 'test_helper'

class InstanceEnisControllerTest < ActionController::TestCase
  setup do
    @instance_eni = instance_enis(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:instance_enis)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create instance_eni" do
    assert_difference('InstanceEni.count') do
      post :create, instance_eni: { attach_date_time: @instance_eni.attach_date_time, attachment_id: @instance_eni.attachment_id, host_id: @instance_eni.host_id, instance_id: @instance_eni.instance_id, mac_address: @instance_eni.mac_address, network_interface_id: @instance_eni.network_interface_id, owner_id: @instance_eni.owner_id, private_dns_name: @instance_eni.private_dns_name, private_ip_addresses: @instance_eni.private_ip_addresses, public_dns_name: @instance_eni.public_dns_name, public_ip: @instance_eni.public_ip, source_dest_check: @instance_eni.source_dest_check, status: @instance_eni.status, subnet_id: @instance_eni.subnet_id, vpc_id: @instance_eni.vpc_id }
    end

    assert_redirected_to instance_eni_path(assigns(:instance_eni))
  end

  test "should show instance_eni" do
    get :show, id: @instance_eni
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @instance_eni
    assert_response :success
  end

  test "should update instance_eni" do
    patch :update, id: @instance_eni, instance_eni: { attach_date_time: @instance_eni.attach_date_time, attachment_id: @instance_eni.attachment_id, host_id: @instance_eni.host_id, instance_id: @instance_eni.instance_id, mac_address: @instance_eni.mac_address, network_interface_id: @instance_eni.network_interface_id, owner_id: @instance_eni.owner_id, private_dns_name: @instance_eni.private_dns_name, private_ip_addresses: @instance_eni.private_ip_addresses, public_dns_name: @instance_eni.public_dns_name, public_ip: @instance_eni.public_ip, source_dest_check: @instance_eni.source_dest_check, status: @instance_eni.status, subnet_id: @instance_eni.subnet_id, vpc_id: @instance_eni.vpc_id }
    assert_redirected_to instance_eni_path(assigns(:instance_eni))
  end

  test "should destroy instance_eni" do
    assert_difference('InstanceEni.count', -1) do
      delete :destroy, id: @instance_eni
    end

    assert_redirected_to instance_enis_path
  end
end

require 'test_helper'

class AwsElasticIpsControllerTest < ActionController::TestCase
  setup do
    @aws_elastic_ip = aws_elastic_ips(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:aws_elastic_ips)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create aws_elastic_ip" do
    assert_difference('AwsElasticIp.count') do
      post :create, aws_elastic_ip: { allocation_id: @aws_elastic_ip.allocation_id, association_id: @aws_elastic_ip.association_id, aws_account_id: @aws_elastic_ip.aws_account_id, aws_region_id: @aws_elastic_ip.aws_region_id, domain: @aws_elastic_ip.domain, instance_id: @aws_elastic_ip.instance_id, network_interface_id: @aws_elastic_ip.network_interface_id, network_interface_owner_id: @aws_elastic_ip.network_interface_owner_id, private_ip_address: @aws_elastic_ip.private_ip_address, public_ip: @aws_elastic_ip.public_ip }
    end

    assert_redirected_to aws_elastic_ip_path(assigns(:aws_elastic_ip))
  end

  test "should show aws_elastic_ip" do
    get :show, id: @aws_elastic_ip
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @aws_elastic_ip
    assert_response :success
  end

  test "should update aws_elastic_ip" do
    patch :update, id: @aws_elastic_ip, aws_elastic_ip: { allocation_id: @aws_elastic_ip.allocation_id, association_id: @aws_elastic_ip.association_id, aws_account_id: @aws_elastic_ip.aws_account_id, aws_region_id: @aws_elastic_ip.aws_region_id, domain: @aws_elastic_ip.domain, instance_id: @aws_elastic_ip.instance_id, network_interface_id: @aws_elastic_ip.network_interface_id, network_interface_owner_id: @aws_elastic_ip.network_interface_owner_id, private_ip_address: @aws_elastic_ip.private_ip_address, public_ip: @aws_elastic_ip.public_ip }
    assert_redirected_to aws_elastic_ip_path(assigns(:aws_elastic_ip))
  end

  test "should destroy aws_elastic_ip" do
    assert_difference('AwsElasticIp.count', -1) do
      delete :destroy, id: @aws_elastic_ip
    end

    assert_redirected_to aws_elastic_ips_path
  end
end

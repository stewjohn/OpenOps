require 'test_helper'

class AwsNetworkAclsControllerTest < ActionController::TestCase
  setup do
    @aws_network_acl = aws_network_acls(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:aws_network_acls)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create aws_network_acl" do
    assert_difference('AwsNetworkAcl.count') do
      post :create, aws_network_acl: { association_acl_id: @aws_network_acl.association_acl_id, association_id: @aws_network_acl.association_id, association_subnet_id: @aws_network_acl.association_subnet_id, aws_account_id: @aws_network_acl.aws_account_id, aws_region_id: @aws_network_acl.aws_region_id, network_acl_id: @aws_network_acl.network_acl_id }
    end

    assert_redirected_to aws_network_acl_path(assigns(:aws_network_acl))
  end

  test "should show aws_network_acl" do
    get :show, id: @aws_network_acl
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @aws_network_acl
    assert_response :success
  end

  test "should update aws_network_acl" do
    patch :update, id: @aws_network_acl, aws_network_acl: { association_acl_id: @aws_network_acl.association_acl_id, association_id: @aws_network_acl.association_id, association_subnet_id: @aws_network_acl.association_subnet_id, aws_account_id: @aws_network_acl.aws_account_id, aws_region_id: @aws_network_acl.aws_region_id, network_acl_id: @aws_network_acl.network_acl_id }
    assert_redirected_to aws_network_acl_path(assigns(:aws_network_acl))
  end

  test "should destroy aws_network_acl" do
    assert_difference('AwsNetworkAcl.count', -1) do
      delete :destroy, id: @aws_network_acl
    end

    assert_redirected_to aws_network_acls_path
  end
end

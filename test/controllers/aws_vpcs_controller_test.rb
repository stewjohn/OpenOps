require 'test_helper'

class AwsVpcsControllerTest < ActionController::TestCase
  setup do
    @aws_vpc = aws_vpcs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:aws_vpcs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create aws_vpc" do
    assert_difference('AwsVpc.count') do
      post :create, aws_vpc: { cidr_block: @aws_vpc.cidr_block, dhcp_options_id: @aws_vpc.dhcp_options_id, instance_default: @aws_vpc.instance_default, is_default: @aws_vpc.is_default, state: @aws_vpc.state, vpc_id: @aws_vpc.vpc_id }
    end

    assert_redirected_to aws_vpc_path(assigns(:aws_vpc))
  end

  test "should show aws_vpc" do
    get :show, id: @aws_vpc
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @aws_vpc
    assert_response :success
  end

  test "should update aws_vpc" do
    patch :update, id: @aws_vpc, aws_vpc: { cidr_block: @aws_vpc.cidr_block, dhcp_options_id: @aws_vpc.dhcp_options_id, instance_default: @aws_vpc.instance_default, is_default: @aws_vpc.is_default, state: @aws_vpc.state, vpc_id: @aws_vpc.vpc_id }
    assert_redirected_to aws_vpc_path(assigns(:aws_vpc))
  end

  test "should destroy aws_vpc" do
    assert_difference('AwsVpc.count', -1) do
      delete :destroy, id: @aws_vpc
    end

    assert_redirected_to aws_vpcs_path
  end
end

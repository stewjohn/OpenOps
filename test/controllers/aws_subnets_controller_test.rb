require 'test_helper'

class AwsSubnetsControllerTest < ActionController::TestCase
  setup do
    @aws_subnet = aws_subnets(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:aws_subnets)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create aws_subnet" do
    assert_difference('AwsSubnet.count') do
      post :create, aws_subnet: { availability_zone: @aws_subnet.availability_zone, available_ip_address_count: @aws_subnet.available_ip_address_count, cidr_block: @aws_subnet.cidr_block, default_for_az: @aws_subnet.default_for_az, map_public_ip_on_launch: @aws_subnet.map_public_ip_on_launch, state: @aws_subnet.state, subnet_id: @aws_subnet.subnet_id, vpc_id: @aws_subnet.vpc_id }
    end

    assert_redirected_to aws_subnet_path(assigns(:aws_subnet))
  end

  test "should show aws_subnet" do
    get :show, id: @aws_subnet
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @aws_subnet
    assert_response :success
  end

  test "should update aws_subnet" do
    patch :update, id: @aws_subnet, aws_subnet: { availability_zone: @aws_subnet.availability_zone, available_ip_address_count: @aws_subnet.available_ip_address_count, cidr_block: @aws_subnet.cidr_block, default_for_az: @aws_subnet.default_for_az, map_public_ip_on_launch: @aws_subnet.map_public_ip_on_launch, state: @aws_subnet.state, subnet_id: @aws_subnet.subnet_id, vpc_id: @aws_subnet.vpc_id }
    assert_redirected_to aws_subnet_path(assigns(:aws_subnet))
  end

  test "should destroy aws_subnet" do
    assert_difference('AwsSubnet.count', -1) do
      delete :destroy, id: @aws_subnet
    end

    assert_redirected_to aws_subnets_path
  end
end

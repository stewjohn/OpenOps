require 'test_helper'

class AwsInternetGatewaysControllerTest < ActionController::TestCase
  setup do
    @aws_internet_gateway = aws_internet_gateways(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:aws_internet_gateways)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create aws_internet_gateway" do
    assert_difference('AwsInternetGateway.count') do
      post :create, aws_internet_gateway: { attachment_state: @aws_internet_gateway.attachment_state, attachment_vpc_id: @aws_internet_gateway.attachment_vpc_id, aws_account_id: @aws_internet_gateway.aws_account_id, aws_region_id: @aws_internet_gateway.aws_region_id, internet_gateway_id: @aws_internet_gateway.internet_gateway_id }
    end

    assert_redirected_to aws_internet_gateway_path(assigns(:aws_internet_gateway))
  end

  test "should show aws_internet_gateway" do
    get :show, id: @aws_internet_gateway
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @aws_internet_gateway
    assert_response :success
  end

  test "should update aws_internet_gateway" do
    patch :update, id: @aws_internet_gateway, aws_internet_gateway: { attachment_state: @aws_internet_gateway.attachment_state, attachment_vpc_id: @aws_internet_gateway.attachment_vpc_id, aws_account_id: @aws_internet_gateway.aws_account_id, aws_region_id: @aws_internet_gateway.aws_region_id, internet_gateway_id: @aws_internet_gateway.internet_gateway_id }
    assert_redirected_to aws_internet_gateway_path(assigns(:aws_internet_gateway))
  end

  test "should destroy aws_internet_gateway" do
    assert_difference('AwsInternetGateway.count', -1) do
      delete :destroy, id: @aws_internet_gateway
    end

    assert_redirected_to aws_internet_gateways_path
  end
end

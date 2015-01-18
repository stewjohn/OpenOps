require 'test_helper'

class AwsDhcpOptionsControllerTest < ActionController::TestCase
  setup do
    @aws_dhcp_option = aws_dhcp_options(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:aws_dhcp_options)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create aws_dhcp_option" do
    assert_difference('AwsDhcpOption.count') do
      post :create, aws_dhcp_option: { aws_account_id: @aws_dhcp_option.aws_account_id, aws_region_id: @aws_dhcp_option.aws_region_id, dhcp_options_id: @aws_dhcp_option.dhcp_options_id }
    end

    assert_redirected_to aws_dhcp_option_path(assigns(:aws_dhcp_option))
  end

  test "should show aws_dhcp_option" do
    get :show, id: @aws_dhcp_option
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @aws_dhcp_option
    assert_response :success
  end

  test "should update aws_dhcp_option" do
    patch :update, id: @aws_dhcp_option, aws_dhcp_option: { aws_account_id: @aws_dhcp_option.aws_account_id, aws_region_id: @aws_dhcp_option.aws_region_id, dhcp_options_id: @aws_dhcp_option.dhcp_options_id }
    assert_redirected_to aws_dhcp_option_path(assigns(:aws_dhcp_option))
  end

  test "should destroy aws_dhcp_option" do
    assert_difference('AwsDhcpOption.count', -1) do
      delete :destroy, id: @aws_dhcp_option
    end

    assert_redirected_to aws_dhcp_options_path
  end
end

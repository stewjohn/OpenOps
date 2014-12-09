require 'test_helper'

class AwsDhcpOptionAttributesControllerTest < ActionController::TestCase
  setup do
    @aws_dhcp_option_attribute = aws_dhcp_option_attributes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:aws_dhcp_option_attributes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create aws_dhcp_option_attribute" do
    assert_difference('AwsDhcpOptionAttribute.count') do
      post :create, aws_dhcp_option_attribute: { dhcp_options_id: @aws_dhcp_option_attribute.dhcp_options_id, key: @aws_dhcp_option_attribute.key, value: @aws_dhcp_option_attribute.value }
    end

    assert_redirected_to aws_dhcp_option_attribute_path(assigns(:aws_dhcp_option_attribute))
  end

  test "should show aws_dhcp_option_attribute" do
    get :show, id: @aws_dhcp_option_attribute
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @aws_dhcp_option_attribute
    assert_response :success
  end

  test "should update aws_dhcp_option_attribute" do
    patch :update, id: @aws_dhcp_option_attribute, aws_dhcp_option_attribute: { dhcp_options_id: @aws_dhcp_option_attribute.dhcp_options_id, key: @aws_dhcp_option_attribute.key, value: @aws_dhcp_option_attribute.value }
    assert_redirected_to aws_dhcp_option_attribute_path(assigns(:aws_dhcp_option_attribute))
  end

  test "should destroy aws_dhcp_option_attribute" do
    assert_difference('AwsDhcpOptionAttribute.count', -1) do
      delete :destroy, id: @aws_dhcp_option_attribute
    end

    assert_redirected_to aws_dhcp_option_attributes_path
  end
end

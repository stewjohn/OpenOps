require 'test_helper'

class AwsAccountAttributesControllerTest < ActionController::TestCase
  setup do
    @aws_account_attribute = aws_account_attributes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:aws_account_attributes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create aws_account_attribute" do
    assert_difference('AwsAccountAttribute.count') do
      post :create, aws_account_attribute: { attribute_name: @aws_account_attribute.attribute_name, attribute_value: @aws_account_attribute.attribute_value, aws_account_id: @aws_account_attribute.aws_account_id }
    end

    assert_redirected_to aws_account_attribute_path(assigns(:aws_account_attribute))
  end

  test "should show aws_account_attribute" do
    get :show, id: @aws_account_attribute
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @aws_account_attribute
    assert_response :success
  end

  test "should update aws_account_attribute" do
    patch :update, id: @aws_account_attribute, aws_account_attribute: { attribute_name: @aws_account_attribute.attribute_name, attribute_value: @aws_account_attribute.attribute_value, aws_account_id: @aws_account_attribute.aws_account_id }
    assert_redirected_to aws_account_attribute_path(assigns(:aws_account_attribute))
  end

  test "should destroy aws_account_attribute" do
    assert_difference('AwsAccountAttribute.count', -1) do
      delete :destroy, id: @aws_account_attribute
    end

    assert_redirected_to aws_account_attributes_path
  end
end

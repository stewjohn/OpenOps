require 'test_helper'

class AwsInternetGatewayTagsControllerTest < ActionController::TestCase
  setup do
    @aws_internet_gateway_tag = aws_internet_gateway_tags(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:aws_internet_gateway_tags)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create aws_internet_gateway_tag" do
    assert_difference('AwsInternetGatewayTag.count') do
      post :create, aws_internet_gateway_tag: { internet_gateway_id: @aws_internet_gateway_tag.internet_gateway_id, key: @aws_internet_gateway_tag.key, value: @aws_internet_gateway_tag.value }
    end

    assert_redirected_to aws_internet_gateway_tag_path(assigns(:aws_internet_gateway_tag))
  end

  test "should show aws_internet_gateway_tag" do
    get :show, id: @aws_internet_gateway_tag
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @aws_internet_gateway_tag
    assert_response :success
  end

  test "should update aws_internet_gateway_tag" do
    patch :update, id: @aws_internet_gateway_tag, aws_internet_gateway_tag: { internet_gateway_id: @aws_internet_gateway_tag.internet_gateway_id, key: @aws_internet_gateway_tag.key, value: @aws_internet_gateway_tag.value }
    assert_redirected_to aws_internet_gateway_tag_path(assigns(:aws_internet_gateway_tag))
  end

  test "should destroy aws_internet_gateway_tag" do
    assert_difference('AwsInternetGatewayTag.count', -1) do
      delete :destroy, id: @aws_internet_gateway_tag
    end

    assert_redirected_to aws_internet_gateway_tags_path
  end
end

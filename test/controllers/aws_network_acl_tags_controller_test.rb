require 'test_helper'

class AwsNetworkAclTagsControllerTest < ActionController::TestCase
  setup do
    @aws_network_acl_tag = aws_network_acl_tags(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:aws_network_acl_tags)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create aws_network_acl_tag" do
    assert_difference('AwsNetworkAclTag.count') do
      post :create, aws_network_acl_tag: { key: @aws_network_acl_tag.key, network_acl_id: @aws_network_acl_tag.network_acl_id, value: @aws_network_acl_tag.value }
    end

    assert_redirected_to aws_network_acl_tag_path(assigns(:aws_network_acl_tag))
  end

  test "should show aws_network_acl_tag" do
    get :show, id: @aws_network_acl_tag
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @aws_network_acl_tag
    assert_response :success
  end

  test "should update aws_network_acl_tag" do
    patch :update, id: @aws_network_acl_tag, aws_network_acl_tag: { key: @aws_network_acl_tag.key, network_acl_id: @aws_network_acl_tag.network_acl_id, value: @aws_network_acl_tag.value }
    assert_redirected_to aws_network_acl_tag_path(assigns(:aws_network_acl_tag))
  end

  test "should destroy aws_network_acl_tag" do
    assert_difference('AwsNetworkAclTag.count', -1) do
      delete :destroy, id: @aws_network_acl_tag
    end

    assert_redirected_to aws_network_acl_tags_path
  end
end

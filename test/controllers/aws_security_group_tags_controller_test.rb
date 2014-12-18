require 'test_helper'

class AwsSecurityGroupTagsControllerTest < ActionController::TestCase
  setup do
    @aws_security_group_tag = aws_security_group_tags(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:aws_security_group_tags)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create aws_security_group_tag" do
    assert_difference('AwsSecurityGroupTag.count') do
      post :create, aws_security_group_tag: { key: @aws_security_group_tag.key, security_group_id: @aws_security_group_tag.security_group_id, value: @aws_security_group_tag.value }
    end

    assert_redirected_to aws_security_group_tag_path(assigns(:aws_security_group_tag))
  end

  test "should show aws_security_group_tag" do
    get :show, id: @aws_security_group_tag
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @aws_security_group_tag
    assert_response :success
  end

  test "should update aws_security_group_tag" do
    patch :update, id: @aws_security_group_tag, aws_security_group_tag: { key: @aws_security_group_tag.key, security_group_id: @aws_security_group_tag.security_group_id, value: @aws_security_group_tag.value }
    assert_redirected_to aws_security_group_tag_path(assigns(:aws_security_group_tag))
  end

  test "should destroy aws_security_group_tag" do
    assert_difference('AwsSecurityGroupTag.count', -1) do
      delete :destroy, id: @aws_security_group_tag
    end

    assert_redirected_to aws_security_group_tags_path
  end
end

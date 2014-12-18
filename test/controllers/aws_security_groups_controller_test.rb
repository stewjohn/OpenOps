require 'test_helper'

class AwsSecurityGroupsControllerTest < ActionController::TestCase
  setup do
    @aws_security_group = aws_security_groups(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:aws_security_groups)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create aws_security_group" do
    assert_difference('AwsSecurityGroup.count') do
      post :create, aws_security_group: { description: @aws_security_group.description, group_id: @aws_security_group.group_id, group_name: @aws_security_group.group_name, owner_id: @aws_security_group.owner_id }
    end

    assert_redirected_to aws_security_group_path(assigns(:aws_security_group))
  end

  test "should show aws_security_group" do
    get :show, id: @aws_security_group
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @aws_security_group
    assert_response :success
  end

  test "should update aws_security_group" do
    patch :update, id: @aws_security_group, aws_security_group: { description: @aws_security_group.description, group_id: @aws_security_group.group_id, group_name: @aws_security_group.group_name, owner_id: @aws_security_group.owner_id }
    assert_redirected_to aws_security_group_path(assigns(:aws_security_group))
  end

  test "should destroy aws_security_group" do
    assert_difference('AwsSecurityGroup.count', -1) do
      delete :destroy, id: @aws_security_group
    end

    assert_redirected_to aws_security_groups_path
  end
end

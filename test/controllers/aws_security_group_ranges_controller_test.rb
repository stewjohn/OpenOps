require 'test_helper'

class AwsSecurityGroupRangesControllerTest < ActionController::TestCase
  setup do
    @aws_security_group_range = aws_security_group_ranges(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:aws_security_group_ranges)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create aws_security_group_range" do
    assert_difference('AwsSecurityGroupRange.count') do
      post :create, aws_security_group_range: { cidr_ip: @aws_security_group_range.cidr_ip, permission_set_id: @aws_security_group_range.permission_set_id, security_group_id: @aws_security_group_range.security_group_id }
    end

    assert_redirected_to aws_security_group_range_path(assigns(:aws_security_group_range))
  end

  test "should show aws_security_group_range" do
    get :show, id: @aws_security_group_range
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @aws_security_group_range
    assert_response :success
  end

  test "should update aws_security_group_range" do
    patch :update, id: @aws_security_group_range, aws_security_group_range: { cidr_ip: @aws_security_group_range.cidr_ip, permission_set_id: @aws_security_group_range.permission_set_id, security_group_id: @aws_security_group_range.security_group_id }
    assert_redirected_to aws_security_group_range_path(assigns(:aws_security_group_range))
  end

  test "should destroy aws_security_group_range" do
    assert_difference('AwsSecurityGroupRange.count', -1) do
      delete :destroy, id: @aws_security_group_range
    end

    assert_redirected_to aws_security_group_ranges_path
  end
end

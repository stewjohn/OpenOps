require 'test_helper'

class AwsSecurityGroupPairsControllerTest < ActionController::TestCase
  setup do
    @aws_security_group_pair = aws_security_group_pairs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:aws_security_group_pairs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create aws_security_group_pair" do
    assert_difference('AwsSecurityGroupPair.count') do
      post :create, aws_security_group_pair: { group_id: @aws_security_group_pair.group_id, group_name: @aws_security_group_pair.group_name, permission_set_id: @aws_security_group_pair.permission_set_id, security_group_id: @aws_security_group_pair.security_group_id, user_id: @aws_security_group_pair.user_id }
    end

    assert_redirected_to aws_security_group_pair_path(assigns(:aws_security_group_pair))
  end

  test "should show aws_security_group_pair" do
    get :show, id: @aws_security_group_pair
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @aws_security_group_pair
    assert_response :success
  end

  test "should update aws_security_group_pair" do
    patch :update, id: @aws_security_group_pair, aws_security_group_pair: { group_id: @aws_security_group_pair.group_id, group_name: @aws_security_group_pair.group_name, permission_set_id: @aws_security_group_pair.permission_set_id, security_group_id: @aws_security_group_pair.security_group_id, user_id: @aws_security_group_pair.user_id }
    assert_redirected_to aws_security_group_pair_path(assigns(:aws_security_group_pair))
  end

  test "should destroy aws_security_group_pair" do
    assert_difference('AwsSecurityGroupPair.count', -1) do
      delete :destroy, id: @aws_security_group_pair
    end

    assert_redirected_to aws_security_group_pairs_path
  end
end

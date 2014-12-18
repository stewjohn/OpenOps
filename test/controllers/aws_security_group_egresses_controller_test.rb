require 'test_helper'

class AwsSecurityGroupEgressesControllerTest < ActionController::TestCase
  setup do
    @aws_security_group_egress = aws_security_group_egresses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:aws_security_group_egresses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create aws_security_group_egress" do
    assert_difference('AwsSecurityGroupEgress.count') do
      post :create, aws_security_group_egress: { egress_id: @aws_security_group_egress.egress_id, from_port: @aws_security_group_egress.from_port, ip_protocol: @aws_security_group_egress.ip_protocol, security_group_id: @aws_security_group_egress.security_group_id, to_port: @aws_security_group_egress.to_port }
    end

    assert_redirected_to aws_security_group_egress_path(assigns(:aws_security_group_egress))
  end

  test "should show aws_security_group_egress" do
    get :show, id: @aws_security_group_egress
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @aws_security_group_egress
    assert_response :success
  end

  test "should update aws_security_group_egress" do
    patch :update, id: @aws_security_group_egress, aws_security_group_egress: { egress_id: @aws_security_group_egress.egress_id, from_port: @aws_security_group_egress.from_port, ip_protocol: @aws_security_group_egress.ip_protocol, security_group_id: @aws_security_group_egress.security_group_id, to_port: @aws_security_group_egress.to_port }
    assert_redirected_to aws_security_group_egress_path(assigns(:aws_security_group_egress))
  end

  test "should destroy aws_security_group_egress" do
    assert_difference('AwsSecurityGroupEgress.count', -1) do
      delete :destroy, id: @aws_security_group_egress
    end

    assert_redirected_to aws_security_group_egresses_path
  end
end

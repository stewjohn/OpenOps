require 'test_helper'

class AwsSecurityGroupIngressesControllerTest < ActionController::TestCase
  setup do
    @aws_security_group_ingress = aws_security_group_ingresses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:aws_security_group_ingresses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create aws_security_group_ingress" do
    assert_difference('AwsSecurityGroupIngress.count') do
      post :create, aws_security_group_ingress: { from_port: @aws_security_group_ingress.from_port, ingress_id: @aws_security_group_ingress.ingress_id, ip_protocol: @aws_security_group_ingress.ip_protocol, security_group_id: @aws_security_group_ingress.security_group_id, to_port: @aws_security_group_ingress.to_port }
    end

    assert_redirected_to aws_security_group_ingress_path(assigns(:aws_security_group_ingress))
  end

  test "should show aws_security_group_ingress" do
    get :show, id: @aws_security_group_ingress
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @aws_security_group_ingress
    assert_response :success
  end

  test "should update aws_security_group_ingress" do
    patch :update, id: @aws_security_group_ingress, aws_security_group_ingress: { from_port: @aws_security_group_ingress.from_port, ingress_id: @aws_security_group_ingress.ingress_id, ip_protocol: @aws_security_group_ingress.ip_protocol, security_group_id: @aws_security_group_ingress.security_group_id, to_port: @aws_security_group_ingress.to_port }
    assert_redirected_to aws_security_group_ingress_path(assigns(:aws_security_group_ingress))
  end

  test "should destroy aws_security_group_ingress" do
    assert_difference('AwsSecurityGroupIngress.count', -1) do
      delete :destroy, id: @aws_security_group_ingress
    end

    assert_redirected_to aws_security_group_ingresses_path
  end
end

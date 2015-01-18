require 'test_helper'

class AwsRouteTablePropogatesControllerTest < ActionController::TestCase
  setup do
    @aws_route_table_propogate = aws_route_table_propogates(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:aws_route_table_propogates)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create aws_route_table_propogate" do
    assert_difference('AwsRouteTablePropogate.count') do
      post :create, aws_route_table_propogate: { gateway_id: @aws_route_table_propogate.gateway_id, route_table_id: @aws_route_table_propogate.route_table_id }
    end

    assert_redirected_to aws_route_table_propogate_path(assigns(:aws_route_table_propogate))
  end

  test "should show aws_route_table_propogate" do
    get :show, id: @aws_route_table_propogate
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @aws_route_table_propogate
    assert_response :success
  end

  test "should update aws_route_table_propogate" do
    patch :update, id: @aws_route_table_propogate, aws_route_table_propogate: { gateway_id: @aws_route_table_propogate.gateway_id, route_table_id: @aws_route_table_propogate.route_table_id }
    assert_redirected_to aws_route_table_propogate_path(assigns(:aws_route_table_propogate))
  end

  test "should destroy aws_route_table_propogate" do
    assert_difference('AwsRouteTablePropogate.count', -1) do
      delete :destroy, id: @aws_route_table_propogate
    end

    assert_redirected_to aws_route_table_propogates_path
  end
end

require 'test_helper'

class AwsRouteTableRoutesControllerTest < ActionController::TestCase
  setup do
    @aws_route_table_route = aws_route_table_routes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:aws_route_table_routes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create aws_route_table_route" do
    assert_difference('AwsRouteTableRoute.count') do
      post :create, aws_route_table_route: { destination_cidr_block: @aws_route_table_route.destination_cidr_block, gateway_id: @aws_route_table_route.gateway_id, instance_id: @aws_route_table_route.instance_id, instance_owner_id: @aws_route_table_route.instance_owner_id, network_interface_id: @aws_route_table_route.network_interface_id, origin: @aws_route_table_route.origin, route_table_id: @aws_route_table_route.route_table_id, state: @aws_route_table_route.state, vpc_peering_connection_id: @aws_route_table_route.vpc_peering_connection_id }
    end

    assert_redirected_to aws_route_table_route_path(assigns(:aws_route_table_route))
  end

  test "should show aws_route_table_route" do
    get :show, id: @aws_route_table_route
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @aws_route_table_route
    assert_response :success
  end

  test "should update aws_route_table_route" do
    patch :update, id: @aws_route_table_route, aws_route_table_route: { destination_cidr_block: @aws_route_table_route.destination_cidr_block, gateway_id: @aws_route_table_route.gateway_id, instance_id: @aws_route_table_route.instance_id, instance_owner_id: @aws_route_table_route.instance_owner_id, network_interface_id: @aws_route_table_route.network_interface_id, origin: @aws_route_table_route.origin, route_table_id: @aws_route_table_route.route_table_id, state: @aws_route_table_route.state, vpc_peering_connection_id: @aws_route_table_route.vpc_peering_connection_id }
    assert_redirected_to aws_route_table_route_path(assigns(:aws_route_table_route))
  end

  test "should destroy aws_route_table_route" do
    assert_difference('AwsRouteTableRoute.count', -1) do
      delete :destroy, id: @aws_route_table_route
    end

    assert_redirected_to aws_route_table_routes_path
  end
end

require 'test_helper'

class AwsRouteTablesControllerTest < ActionController::TestCase
  setup do
    @aws_route_table = aws_route_tables(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:aws_route_tables)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create aws_route_table" do
    assert_difference('AwsRouteTable.count') do
      post :create, aws_route_table: { aws_account_id: @aws_route_table.aws_account_id, aws_region_id: @aws_route_table.aws_region_id, route_table_id: @aws_route_table.route_table_id, vpc_id: @aws_route_table.vpc_id }
    end

    assert_redirected_to aws_route_table_path(assigns(:aws_route_table))
  end

  test "should show aws_route_table" do
    get :show, id: @aws_route_table
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @aws_route_table
    assert_response :success
  end

  test "should update aws_route_table" do
    patch :update, id: @aws_route_table, aws_route_table: { aws_account_id: @aws_route_table.aws_account_id, aws_region_id: @aws_route_table.aws_region_id, route_table_id: @aws_route_table.route_table_id, vpc_id: @aws_route_table.vpc_id }
    assert_redirected_to aws_route_table_path(assigns(:aws_route_table))
  end

  test "should destroy aws_route_table" do
    assert_difference('AwsRouteTable.count', -1) do
      delete :destroy, id: @aws_route_table
    end

    assert_redirected_to aws_route_tables_path
  end
end

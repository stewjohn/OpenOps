require 'test_helper'

class AwsRouteTableAssociationsControllerTest < ActionController::TestCase
  setup do
    @aws_route_table_association = aws_route_table_associations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:aws_route_table_associations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create aws_route_table_association" do
    assert_difference('AwsRouteTableAssociation.count') do
      post :create, aws_route_table_association: { main: @aws_route_table_association.main, route_table_association_id: @aws_route_table_association.route_table_association_id, route_table_id: @aws_route_table_association.route_table_id, route_table_id: @aws_route_table_association.route_table_id, subnet_id: @aws_route_table_association.subnet_id }
    end

    assert_redirected_to aws_route_table_association_path(assigns(:aws_route_table_association))
  end

  test "should show aws_route_table_association" do
    get :show, id: @aws_route_table_association
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @aws_route_table_association
    assert_response :success
  end

  test "should update aws_route_table_association" do
    patch :update, id: @aws_route_table_association, aws_route_table_association: { main: @aws_route_table_association.main, route_table_association_id: @aws_route_table_association.route_table_association_id, route_table_id: @aws_route_table_association.route_table_id, route_table_id: @aws_route_table_association.route_table_id, subnet_id: @aws_route_table_association.subnet_id }
    assert_redirected_to aws_route_table_association_path(assigns(:aws_route_table_association))
  end

  test "should destroy aws_route_table_association" do
    assert_difference('AwsRouteTableAssociation.count', -1) do
      delete :destroy, id: @aws_route_table_association
    end

    assert_redirected_to aws_route_table_associations_path
  end
end

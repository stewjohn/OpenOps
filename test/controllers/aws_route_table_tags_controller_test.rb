require 'test_helper'

class AwsRouteTableTagsControllerTest < ActionController::TestCase
  setup do
    @aws_route_table_tag = aws_route_table_tags(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:aws_route_table_tags)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create aws_route_table_tag" do
    assert_difference('AwsRouteTableTag.count') do
      post :create, aws_route_table_tag: { key: @aws_route_table_tag.key, route_table_id: @aws_route_table_tag.route_table_id, value: @aws_route_table_tag.value }
    end

    assert_redirected_to aws_route_table_tag_path(assigns(:aws_route_table_tag))
  end

  test "should show aws_route_table_tag" do
    get :show, id: @aws_route_table_tag
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @aws_route_table_tag
    assert_response :success
  end

  test "should update aws_route_table_tag" do
    patch :update, id: @aws_route_table_tag, aws_route_table_tag: { key: @aws_route_table_tag.key, route_table_id: @aws_route_table_tag.route_table_id, value: @aws_route_table_tag.value }
    assert_redirected_to aws_route_table_tag_path(assigns(:aws_route_table_tag))
  end

  test "should destroy aws_route_table_tag" do
    assert_difference('AwsRouteTableTag.count', -1) do
      delete :destroy, id: @aws_route_table_tag
    end

    assert_redirected_to aws_route_table_tags_path
  end
end

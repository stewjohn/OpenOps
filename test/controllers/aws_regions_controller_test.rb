require 'test_helper'

class AwsRegionsControllerTest < ActionController::TestCase
  setup do
    @aws_region = aws_regions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:aws_regions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create aws_region" do
    assert_difference('AwsRegion.count') do
      post :create, aws_region: { name: @aws_region.name }
    end

    assert_redirected_to aws_region_path(assigns(:aws_region))
  end

  test "should show aws_region" do
    get :show, id: @aws_region
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @aws_region
    assert_response :success
  end

  test "should update aws_region" do
    patch :update, id: @aws_region, aws_region: { name: @aws_region.name }
    assert_redirected_to aws_region_path(assigns(:aws_region))
  end

  test "should destroy aws_region" do
    assert_difference('AwsRegion.count', -1) do
      delete :destroy, id: @aws_region
    end

    assert_redirected_to aws_regions_path
  end
end

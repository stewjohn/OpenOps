require 'test_helper'

class AwsAzsControllerTest < ActionController::TestCase
  setup do
    @aws_az = aws_azs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:aws_azs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create aws_az" do
    assert_difference('AwsAz.count') do
      post :create, aws_az: { aws_region_id: @aws_az.aws_region_id, name: @aws_az.name }
    end

    assert_redirected_to aws_az_path(assigns(:aws_az))
  end

  test "should show aws_az" do
    get :show, id: @aws_az
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @aws_az
    assert_response :success
  end

  test "should update aws_az" do
    patch :update, id: @aws_az, aws_az: { aws_region_id: @aws_az.aws_region_id, name: @aws_az.name }
    assert_redirected_to aws_az_path(assigns(:aws_az))
  end

  test "should destroy aws_az" do
    assert_difference('AwsAz.count', -1) do
      delete :destroy, id: @aws_az
    end

    assert_redirected_to aws_azs_path
  end
end

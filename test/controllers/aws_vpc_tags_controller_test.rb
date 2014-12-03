require 'test_helper'

class AwsVpcTagsControllerTest < ActionController::TestCase
  setup do
    @aws_vpc_tag = aws_vpc_tags(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:aws_vpc_tags)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create aws_vpc_tag" do
    assert_difference('AwsVpcTag.count') do
      post :create, aws_vpc_tag: { aws_vpc_id: @aws_vpc_tag.aws_vpc_id, name: @aws_vpc_tag.name, value: @aws_vpc_tag.value }
    end

    assert_redirected_to aws_vpc_tag_path(assigns(:aws_vpc_tag))
  end

  test "should show aws_vpc_tag" do
    get :show, id: @aws_vpc_tag
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @aws_vpc_tag
    assert_response :success
  end

  test "should update aws_vpc_tag" do
    patch :update, id: @aws_vpc_tag, aws_vpc_tag: { aws_vpc_id: @aws_vpc_tag.aws_vpc_id, name: @aws_vpc_tag.name, value: @aws_vpc_tag.value }
    assert_redirected_to aws_vpc_tag_path(assigns(:aws_vpc_tag))
  end

  test "should destroy aws_vpc_tag" do
    assert_difference('AwsVpcTag.count', -1) do
      delete :destroy, id: @aws_vpc_tag
    end

    assert_redirected_to aws_vpc_tags_path
  end
end

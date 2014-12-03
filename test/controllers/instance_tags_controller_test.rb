require 'test_helper'

class InstanceTagsControllerTest < ActionController::TestCase
  setup do
    @instance_tag = instance_tags(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:instance_tags)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create instance_tag" do
    assert_difference('InstanceTag.count') do
      post :create, instance_tag: { instance_id: @instance_tag.instance_id, name: @instance_tag.name, value: @instance_tag.value }
    end

    assert_redirected_to instance_tag_path(assigns(:instance_tag))
  end

  test "should show instance_tag" do
    get :show, id: @instance_tag
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @instance_tag
    assert_response :success
  end

  test "should update instance_tag" do
    patch :update, id: @instance_tag, instance_tag: { instance_id: @instance_tag.instance_id, name: @instance_tag.name, value: @instance_tag.value }
    assert_redirected_to instance_tag_path(assigns(:instance_tag))
  end

  test "should destroy instance_tag" do
    assert_difference('InstanceTag.count', -1) do
      delete :destroy, id: @instance_tag
    end

    assert_redirected_to instance_tags_path
  end
end

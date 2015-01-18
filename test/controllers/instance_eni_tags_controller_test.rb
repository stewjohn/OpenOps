require 'test_helper'

class InstanceEniTagsControllerTest < ActionController::TestCase
  setup do
    @instance_eni_tag = instance_eni_tags(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:instance_eni_tags)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create instance_eni_tag" do
    assert_difference('InstanceEniTag.count') do
      post :create, instance_eni_tag: { instance_id: @instance_eni_tag.instance_id, key: @instance_eni_tag.key, value: @instance_eni_tag.value }
    end

    assert_redirected_to instance_eni_tag_path(assigns(:instance_eni_tag))
  end

  test "should show instance_eni_tag" do
    get :show, id: @instance_eni_tag
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @instance_eni_tag
    assert_response :success
  end

  test "should update instance_eni_tag" do
    patch :update, id: @instance_eni_tag, instance_eni_tag: { instance_id: @instance_eni_tag.instance_id, key: @instance_eni_tag.key, value: @instance_eni_tag.value }
    assert_redirected_to instance_eni_tag_path(assigns(:instance_eni_tag))
  end

  test "should destroy instance_eni_tag" do
    assert_difference('InstanceEniTag.count', -1) do
      delete :destroy, id: @instance_eni_tag
    end

    assert_redirected_to instance_eni_tags_path
  end
end

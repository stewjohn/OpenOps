require 'test_helper'

class EbsVolumeTagsControllerTest < ActionController::TestCase
  setup do
    @ebs_volume_tag = ebs_volume_tags(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ebs_volume_tags)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ebs_volume_tag" do
    assert_difference('EbsVolumeTag.count') do
      post :create, ebs_volume_tag: { key: @ebs_volume_tag.key, value: @ebs_volume_tag.value, volume_id: @ebs_volume_tag.volume_id }
    end

    assert_redirected_to ebs_volume_tag_path(assigns(:ebs_volume_tag))
  end

  test "should show ebs_volume_tag" do
    get :show, id: @ebs_volume_tag
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @ebs_volume_tag
    assert_response :success
  end

  test "should update ebs_volume_tag" do
    patch :update, id: @ebs_volume_tag, ebs_volume_tag: { key: @ebs_volume_tag.key, value: @ebs_volume_tag.value, volume_id: @ebs_volume_tag.volume_id }
    assert_redirected_to ebs_volume_tag_path(assigns(:ebs_volume_tag))
  end

  test "should destroy ebs_volume_tag" do
    assert_difference('EbsVolumeTag.count', -1) do
      delete :destroy, id: @ebs_volume_tag
    end

    assert_redirected_to ebs_volume_tags_path
  end
end

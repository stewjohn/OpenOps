require 'test_helper'

class EbsSnapshotTagsControllerTest < ActionController::TestCase
  setup do
    @ebs_snapshot_tag = ebs_snapshot_tags(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ebs_snapshot_tags)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ebs_snapshot_tag" do
    assert_difference('EbsSnapshotTag.count') do
      post :create, ebs_snapshot_tag: { key: @ebs_snapshot_tag.key, snapshot_id: @ebs_snapshot_tag.snapshot_id, value: @ebs_snapshot_tag.value }
    end

    assert_redirected_to ebs_snapshot_tag_path(assigns(:ebs_snapshot_tag))
  end

  test "should show ebs_snapshot_tag" do
    get :show, id: @ebs_snapshot_tag
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @ebs_snapshot_tag
    assert_response :success
  end

  test "should update ebs_snapshot_tag" do
    patch :update, id: @ebs_snapshot_tag, ebs_snapshot_tag: { key: @ebs_snapshot_tag.key, snapshot_id: @ebs_snapshot_tag.snapshot_id, value: @ebs_snapshot_tag.value }
    assert_redirected_to ebs_snapshot_tag_path(assigns(:ebs_snapshot_tag))
  end

  test "should destroy ebs_snapshot_tag" do
    assert_difference('EbsSnapshotTag.count', -1) do
      delete :destroy, id: @ebs_snapshot_tag
    end

    assert_redirected_to ebs_snapshot_tags_path
  end
end

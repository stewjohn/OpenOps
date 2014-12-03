require 'test_helper'

class EbsSnapshotsControllerTest < ActionController::TestCase
  setup do
    @ebs_snapshot = ebs_snapshots(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ebs_snapshots)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ebs_snapshot" do
    assert_difference('EbsSnapshot.count') do
      post :create, ebs_snapshot: { aws_account_id: @ebs_snapshot.aws_account_id, aws_region_id: @ebs_snapshot.aws_region_id, description: @ebs_snapshot.description, encrypted: @ebs_snapshot.encrypted, owner_id: @ebs_snapshot.owner_id, progress: @ebs_snapshot.progress, replicated: @ebs_snapshot.replicated, snapshot_id: @ebs_snapshot.snapshot_id, start_time: @ebs_snapshot.start_time, state: @ebs_snapshot.state, volume_id: @ebs_snapshot.volume_id, volume_size: @ebs_snapshot.volume_size }
    end

    assert_redirected_to ebs_snapshot_path(assigns(:ebs_snapshot))
  end

  test "should show ebs_snapshot" do
    get :show, id: @ebs_snapshot
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @ebs_snapshot
    assert_response :success
  end

  test "should update ebs_snapshot" do
    patch :update, id: @ebs_snapshot, ebs_snapshot: { aws_account_id: @ebs_snapshot.aws_account_id, aws_region_id: @ebs_snapshot.aws_region_id, description: @ebs_snapshot.description, encrypted: @ebs_snapshot.encrypted, owner_id: @ebs_snapshot.owner_id, progress: @ebs_snapshot.progress, replicated: @ebs_snapshot.replicated, snapshot_id: @ebs_snapshot.snapshot_id, start_time: @ebs_snapshot.start_time, state: @ebs_snapshot.state, volume_id: @ebs_snapshot.volume_id, volume_size: @ebs_snapshot.volume_size }
    assert_redirected_to ebs_snapshot_path(assigns(:ebs_snapshot))
  end

  test "should destroy ebs_snapshot" do
    assert_difference('EbsSnapshot.count', -1) do
      delete :destroy, id: @ebs_snapshot
    end

    assert_redirected_to ebs_snapshots_path
  end
end

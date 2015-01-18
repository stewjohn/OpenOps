require 'test_helper'

class EbsVolumesControllerTest < ActionController::TestCase
  setup do
    @ebs_volume = ebs_volumes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ebs_volumes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ebs_volume" do
    assert_difference('EbsVolume.count') do
      post :create, ebs_volume: { availability_zone: @ebs_volume.availability_zone, aws_account_id: @ebs_volume.aws_account_id, aws_region_id: @ebs_volume.aws_region_id, create_time: @ebs_volume.create_time, encrypted: @ebs_volume.encrypted, iops: @ebs_volume.iops, size: @ebs_volume.size, snapshot_id: @ebs_volume.snapshot_id, state: @ebs_volume.state, volume_id: @ebs_volume.volume_id, volume_type: @ebs_volume.volume_type }
    end

    assert_redirected_to ebs_volume_path(assigns(:ebs_volume))
  end

  test "should show ebs_volume" do
    get :show, id: @ebs_volume
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @ebs_volume
    assert_response :success
  end

  test "should update ebs_volume" do
    patch :update, id: @ebs_volume, ebs_volume: { availability_zone: @ebs_volume.availability_zone, aws_account_id: @ebs_volume.aws_account_id, aws_region_id: @ebs_volume.aws_region_id, create_time: @ebs_volume.create_time, encrypted: @ebs_volume.encrypted, iops: @ebs_volume.iops, size: @ebs_volume.size, snapshot_id: @ebs_volume.snapshot_id, state: @ebs_volume.state, volume_id: @ebs_volume.volume_id, volume_type: @ebs_volume.volume_type }
    assert_redirected_to ebs_volume_path(assigns(:ebs_volume))
  end

  test "should destroy ebs_volume" do
    assert_difference('EbsVolume.count', -1) do
      delete :destroy, id: @ebs_volume
    end

    assert_redirected_to ebs_volumes_path
  end
end

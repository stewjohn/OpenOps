require 'test_helper'

class InstanceBlockDeviceMappingsControllerTest < ActionController::TestCase
  setup do
    @instance_block_device_mapping = instance_block_device_mappings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:instance_block_device_mappings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create instance_block_device_mapping" do
    assert_difference('InstanceBlockDeviceMapping.count') do
      post :create, instance_block_device_mapping: { device_name: @instance_block_device_mapping.device_name, instance_id: @instance_block_device_mapping.instance_id, volume_id: @instance_block_device_mapping.volume_id }
    end

    assert_redirected_to instance_block_device_mapping_path(assigns(:instance_block_device_mapping))
  end

  test "should show instance_block_device_mapping" do
    get :show, id: @instance_block_device_mapping
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @instance_block_device_mapping
    assert_response :success
  end

  test "should update instance_block_device_mapping" do
    patch :update, id: @instance_block_device_mapping, instance_block_device_mapping: { device_name: @instance_block_device_mapping.device_name, instance_id: @instance_block_device_mapping.instance_id, volume_id: @instance_block_device_mapping.volume_id }
    assert_redirected_to instance_block_device_mapping_path(assigns(:instance_block_device_mapping))
  end

  test "should destroy instance_block_device_mapping" do
    assert_difference('InstanceBlockDeviceMapping.count', -1) do
      delete :destroy, id: @instance_block_device_mapping
    end

    assert_redirected_to instance_block_device_mappings_path
  end
end

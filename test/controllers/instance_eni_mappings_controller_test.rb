require 'test_helper'

class InstanceEniMappingsControllerTest < ActionController::TestCase
  setup do
    @instance_eni_mapping = instance_eni_mappings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:instance_eni_mappings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create instance_eni_mapping" do
    assert_difference('InstanceEniMapping.count') do
      post :create, instance_eni_mapping: { instance_id: @instance_eni_mapping.instance_id, network_interface_id: @instance_eni_mapping.network_interface_id }
    end

    assert_redirected_to instance_eni_mapping_path(assigns(:instance_eni_mapping))
  end

  test "should show instance_eni_mapping" do
    get :show, id: @instance_eni_mapping
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @instance_eni_mapping
    assert_response :success
  end

  test "should update instance_eni_mapping" do
    patch :update, id: @instance_eni_mapping, instance_eni_mapping: { instance_id: @instance_eni_mapping.instance_id, network_interface_id: @instance_eni_mapping.network_interface_id }
    assert_redirected_to instance_eni_mapping_path(assigns(:instance_eni_mapping))
  end

  test "should destroy instance_eni_mapping" do
    assert_difference('InstanceEniMapping.count', -1) do
      delete :destroy, id: @instance_eni_mapping
    end

    assert_redirected_to instance_eni_mappings_path
  end
end

require 'test_helper'

class InstanceSecurityGroupMappingsControllerTest < ActionController::TestCase
  setup do
    @instance_security_group_mapping = instance_security_group_mappings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:instance_security_group_mappings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create instance_security_group_mapping" do
    assert_difference('InstanceSecurityGroupMapping.count') do
      post :create, instance_security_group_mapping: { group_id: @instance_security_group_mapping.group_id, instance_id: @instance_security_group_mapping.instance_id }
    end

    assert_redirected_to instance_security_group_mapping_path(assigns(:instance_security_group_mapping))
  end

  test "should show instance_security_group_mapping" do
    get :show, id: @instance_security_group_mapping
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @instance_security_group_mapping
    assert_response :success
  end

  test "should update instance_security_group_mapping" do
    patch :update, id: @instance_security_group_mapping, instance_security_group_mapping: { group_id: @instance_security_group_mapping.group_id, instance_id: @instance_security_group_mapping.instance_id }
    assert_redirected_to instance_security_group_mapping_path(assigns(:instance_security_group_mapping))
  end

  test "should destroy instance_security_group_mapping" do
    assert_difference('InstanceSecurityGroupMapping.count', -1) do
      delete :destroy, id: @instance_security_group_mapping
    end

    assert_redirected_to instance_security_group_mappings_path
  end
end

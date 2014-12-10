require 'test_helper'

class AwsNetworkAclEntriesControllerTest < ActionController::TestCase
  setup do
    @aws_network_acl_entry = aws_network_acl_entries(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:aws_network_acl_entries)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create aws_network_acl_entry" do
    assert_difference('AwsNetworkAclEntry.count') do
      post :create, aws_network_acl_entry: { cidr_block: @aws_network_acl_entry.cidr_block, egress: @aws_network_acl_entry.egress, icmp_type_code: @aws_network_acl_entry.icmp_type_code, network_acl_id: @aws_network_acl_entry.network_acl_id, port_range_from: @aws_network_acl_entry.port_range_from, port_range_to: @aws_network_acl_entry.port_range_to, protocol: @aws_network_acl_entry.protocol, rule_action: @aws_network_acl_entry.rule_action, rule_number: @aws_network_acl_entry.rule_number }
    end

    assert_redirected_to aws_network_acl_entry_path(assigns(:aws_network_acl_entry))
  end

  test "should show aws_network_acl_entry" do
    get :show, id: @aws_network_acl_entry
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @aws_network_acl_entry
    assert_response :success
  end

  test "should update aws_network_acl_entry" do
    patch :update, id: @aws_network_acl_entry, aws_network_acl_entry: { cidr_block: @aws_network_acl_entry.cidr_block, egress: @aws_network_acl_entry.egress, icmp_type_code: @aws_network_acl_entry.icmp_type_code, network_acl_id: @aws_network_acl_entry.network_acl_id, port_range_from: @aws_network_acl_entry.port_range_from, port_range_to: @aws_network_acl_entry.port_range_to, protocol: @aws_network_acl_entry.protocol, rule_action: @aws_network_acl_entry.rule_action, rule_number: @aws_network_acl_entry.rule_number }
    assert_redirected_to aws_network_acl_entry_path(assigns(:aws_network_acl_entry))
  end

  test "should destroy aws_network_acl_entry" do
    assert_difference('AwsNetworkAclEntry.count', -1) do
      delete :destroy, id: @aws_network_acl_entry
    end

    assert_redirected_to aws_network_acl_entries_path
  end
end

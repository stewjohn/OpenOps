require 'test_helper'

class SysidsControllerTest < ActionController::TestCase
  setup do
    @sysid = sysids(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:sysids)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create sysid" do
    assert_difference('Sysid.count') do
      post :create, sysid: { email_notification: @sysid.email_notification, name: @sysid.name, owner: @sysid.owner }
    end

    assert_redirected_to sysid_path(assigns(:sysid))
  end

  test "should show sysid" do
    get :show, id: @sysid
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @sysid
    assert_response :success
  end

  test "should update sysid" do
    patch :update, id: @sysid, sysid: { email_notification: @sysid.email_notification, name: @sysid.name, owner: @sysid.owner }
    assert_redirected_to sysid_path(assigns(:sysid))
  end

  test "should destroy sysid" do
    assert_difference('Sysid.count', -1) do
      delete :destroy, id: @sysid
    end

    assert_redirected_to sysids_path
  end
end

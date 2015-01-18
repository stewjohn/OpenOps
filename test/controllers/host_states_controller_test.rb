require 'test_helper'

class HostStatesControllerTest < ActionController::TestCase
  setup do
    @host_state = host_states(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:host_states)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create host_state" do
    assert_difference('HostState.count') do
      post :create, host_state: { name: @host_state.name }
    end

    assert_redirected_to host_state_path(assigns(:host_state))
  end

  test "should show host_state" do
    get :show, id: @host_state
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @host_state
    assert_response :success
  end

  test "should update host_state" do
    patch :update, id: @host_state, host_state: { name: @host_state.name }
    assert_redirected_to host_state_path(assigns(:host_state))
  end

  test "should destroy host_state" do
    assert_difference('HostState.count', -1) do
      delete :destroy, id: @host_state
    end

    assert_redirected_to host_states_path
  end
end

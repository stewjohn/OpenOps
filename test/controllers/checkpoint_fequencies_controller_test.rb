require 'test_helper'

class CheckpointFequenciesControllerTest < ActionController::TestCase
  setup do
    @checkpoint_fequency = checkpoint_fequencies(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:checkpoint_fequencies)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create checkpoint_fequency" do
    assert_difference('CheckpointFequency.count') do
      post :create, checkpoint_fequency: { hours_apart: @checkpoint_fequency.hours_apart, name: @checkpoint_fequency.name }
    end

    assert_redirected_to checkpoint_fequency_path(assigns(:checkpoint_fequency))
  end

  test "should show checkpoint_fequency" do
    get :show, id: @checkpoint_fequency
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @checkpoint_fequency
    assert_response :success
  end

  test "should update checkpoint_fequency" do
    patch :update, id: @checkpoint_fequency, checkpoint_fequency: { hours_apart: @checkpoint_fequency.hours_apart, name: @checkpoint_fequency.name }
    assert_redirected_to checkpoint_fequency_path(assigns(:checkpoint_fequency))
  end

  test "should destroy checkpoint_fequency" do
    assert_difference('CheckpointFequency.count', -1) do
      delete :destroy, id: @checkpoint_fequency
    end

    assert_redirected_to checkpoint_fequencies_path
  end
end

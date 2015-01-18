require 'test_helper'

class CheckpointFrequenciesControllerTest < ActionController::TestCase
  setup do
    @checkpoint_frequency = checkpoint_frequencies(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:checkpoint_frequencies)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create checkpoint_frequency" do
    assert_difference('CheckpointFrequency.count') do
      post :create, checkpoint_frequency: { hours_apart: @checkpoint_frequency.hours_apart, name: @checkpoint_frequency.name }
    end

    assert_redirected_to checkpoint_frequency_path(assigns(:checkpoint_frequency))
  end

  test "should show checkpoint_frequency" do
    get :show, id: @checkpoint_frequency
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @checkpoint_frequency
    assert_response :success
  end

  test "should update checkpoint_frequency" do
    patch :update, id: @checkpoint_frequency, checkpoint_frequency: { hours_apart: @checkpoint_frequency.hours_apart, name: @checkpoint_frequency.name }
    assert_redirected_to checkpoint_frequency_path(assigns(:checkpoint_frequency))
  end

  test "should destroy checkpoint_frequency" do
    assert_difference('CheckpointFrequency.count', -1) do
      delete :destroy, id: @checkpoint_frequency
    end

    assert_redirected_to checkpoint_frequencies_path
  end
end

require 'test_helper'

class AwsKeyPairsControllerTest < ActionController::TestCase
  setup do
    @aws_key_pair = aws_key_pairs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:aws_key_pairs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create aws_key_pair" do
    assert_difference('AwsKeyPair.count') do
      post :create, aws_key_pair: { aws_account_id: @aws_key_pair.aws_account_id, aws_region_id: @aws_key_pair.aws_region_id, key_fingerprint: @aws_key_pair.key_fingerprint, key_name: @aws_key_pair.key_name }
    end

    assert_redirected_to aws_key_pair_path(assigns(:aws_key_pair))
  end

  test "should show aws_key_pair" do
    get :show, id: @aws_key_pair
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @aws_key_pair
    assert_response :success
  end

  test "should update aws_key_pair" do
    patch :update, id: @aws_key_pair, aws_key_pair: { aws_account_id: @aws_key_pair.aws_account_id, aws_region_id: @aws_key_pair.aws_region_id, key_fingerprint: @aws_key_pair.key_fingerprint, key_name: @aws_key_pair.key_name }
    assert_redirected_to aws_key_pair_path(assigns(:aws_key_pair))
  end

  test "should destroy aws_key_pair" do
    assert_difference('AwsKeyPair.count', -1) do
      delete :destroy, id: @aws_key_pair
    end

    assert_redirected_to aws_key_pairs_path
  end
end

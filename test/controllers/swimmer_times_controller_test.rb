require 'test_helper'

class SwimmerTimesControllerTest < ActionController::TestCase
  setup do
    @swimmer_time = swimmer_times(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:swimmer_times)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create swimmer_time" do
    assert_difference('SwimmerTime.count') do
      post :create, swimmer_time: { club: @swimmer_time.club, date: @swimmer_time.date, length: @swimmer_time.length, stroke: @swimmer_time.stroke, swimmer_id: @swimmer_time.swimmer_id, times: @swimmer_time.times, venue: @swimmer_time.venue }
    end

    assert_redirected_to swimmer_time_path(assigns(:swimmer_time))
  end

  test "should show swimmer_time" do
    get :show, id: @swimmer_time
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @swimmer_time
    assert_response :success
  end

  test "should update swimmer_time" do
    patch :update, id: @swimmer_time, swimmer_time: { club: @swimmer_time.club, date: @swimmer_time.date, length: @swimmer_time.length, stroke: @swimmer_time.stroke, swimmer_id: @swimmer_time.swimmer_id, times: @swimmer_time.times, venue: @swimmer_time.venue }
    assert_redirected_to swimmer_time_path(assigns(:swimmer_time))
  end

  test "should destroy swimmer_time" do
    assert_difference('SwimmerTime.count', -1) do
      delete :destroy, id: @swimmer_time
    end

    assert_redirected_to swimmer_times_path
  end
end

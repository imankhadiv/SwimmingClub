require 'test_helper'

class PageControllerTest < ActionController::TestCase
  test "should get welcome" do
    get :welcome
    assert_response :success
  end

  test "should get awaiting" do
    get :awaiting
    assert_response :success
  end

end

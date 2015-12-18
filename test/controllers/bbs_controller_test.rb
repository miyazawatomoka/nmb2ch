require 'test_helper'

class BbsControllerTest < ActionController::TestCase
  test "should get show" do
    get :show
    assert_response :success
  end

end

require 'test_helper'

class TutorialControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get tutorial_index_url
    assert_response :success
  end

end

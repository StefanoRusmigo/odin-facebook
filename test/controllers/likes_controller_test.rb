require 'test_helper'

class LikesControllerTest < ActionDispatch::IntegrationTest
  test "should get create,destroy" do
    get likes_create,destroy_url
    assert_response :success
  end

end

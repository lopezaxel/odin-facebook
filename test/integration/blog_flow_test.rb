require 'test_helper'

class BlogFlowTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end

  test "loads index page" do
    get "/"
    assert "Posts#index"
  end

  test "loads write post page" do
    get "/posts/new"
    assert "Posts#new"
  end

  test "loads friend requests index page" do
    get "/friend_requests"
    assert "FriendRequests#index"
  end
end

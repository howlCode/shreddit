require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
    
  def setup
    @post = posts(:one)
    @posts = posts(:one, :two)
  end

  test "show all posts" do
    get posts_path
    assert_response :success
  end

  # test "should create post" do
  #   sign_in users(:valid)
  #   assert_difference('Post.count') do
  #     post posts_url, params: { post: { 
  #     name: "Test Metal", user: users(:valid), 
  #     subshreddit: subshreddits(:one) } }
  #   end
  #   assert_redirected_to post_path(Post.last)
  # end

end
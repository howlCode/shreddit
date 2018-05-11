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

  test "should create post" do
    sign_in users(:valid)
    assert_difference('Post.count') do
      post posts_url, params: { post: @post.attributes }
    end
    assert_redirected_to(Post.first)
  end

  test "should update post" do
    sign_in users(:valid)
    post = posts(:one)
   
    patch post_url(post), params: { post: { title: "updated" } }
   
    assert_redirected_to post_path(post)
    post.reload
    assert_equal "updated", post.title
  end

end
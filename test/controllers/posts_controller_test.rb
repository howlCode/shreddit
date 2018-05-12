require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
    
  def setup
    @post = posts(:one)
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

  test "should not create post if user is not signed in" do

    assert_difference('Post.count', 0) do
      post posts_url, params: { post: @post.attributes }
    end

    assert_redirected_to(new_user_session_path)
  end

  test "should update post" do
    sign_in users(:valid)

    patch post_url(@post), params: { post: { title: "updated" } }
   
    assert_redirected_to post_path(@post)
    @post.reload
    assert_equal "updated", @post.title
  end

  test "should destroy post" do
    sign_in users(:valid)
    
    assert_difference('Post.count', -1) do
      delete post_url(@post)
    end
 
    assert_redirected_to posts_path
  end

end
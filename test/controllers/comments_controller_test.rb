require 'test_helper'

class CommentsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  def setup
    @user = users(:valid)
    @post = posts(:one)
  end

  test "should create comment" do
    sign_in @user

    assert_difference('Comment.count') do
      post post_comments_url(post_id: @post.id), params: { comment: { body: 'test', post_id: @post.id, user_id: @user.id } }
    end

    assert_redirected_to(@post)
  end

  test "should not create comment if user is not signed in" do
    @user = nil

    assert_difference('Comment.count', 0) do
      post post_comments_url(post_id: @post.id), params: { comment: { body: 'test', post_id: @post.id, user_id: 1 } }
    end

    assert_redirected_to(new_user_session_path)
  end

end
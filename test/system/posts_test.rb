require "application_system_test_case"

class PostsTest < ApplicationSystemTestCase
  
	def setup
		@subshreddit = subshreddits(:one)
		@user = users(:valid)
		@post = Post.create!(subshreddit_id: @subshreddit.id, user_id: @user.id, title: 'sup', body: 'test')
	end

  test "view index of all posts" do
    visit posts_path
    assert_selector "div", id: "main-posts"
  end

  test 'should show a single post' do
  	visit post_path(@post)
  	assert_selector "h2", id: "single-post"
  end

end

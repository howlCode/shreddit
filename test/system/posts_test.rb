require "application_system_test_case"

class PostsTest < ApplicationSystemTestCase
  
  test "view index of all posts" do
    visit posts_path
    assert_selector "div", id: "main-posts"
  end

end

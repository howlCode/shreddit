require 'test_helper'

class SubshredditsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
    
  def setup
    @subshreddit = subshreddits(:one)
  end

  test "should create subshreddit" do
    sign_in users(:valid)
    assert_difference('Subshreddit.count') do
      post subshreddits_url, params: { subshreddit: { name: 'tester', user_id: users(:valid).id } }
    end
    assert_redirected_to(Subshreddit.last)
  end

  test "should not create subshreddit if user is not signed in" do
    assert_difference('Subshreddit.count', 0) do
      post subshreddits_url, params: { subshreddit: @subshreddit.attributes }
    end
    assert_redirected_to(new_user_session_path)
  end

  test "should update subshreddit" do
    sign_in users(:valid)

    patch subshreddit_url(@subshreddit), params: { subshreddit: { name: "updated" } }
   
    assert_redirected_to subshreddit_url(@subshreddit)
    @subshreddit.reload
    assert_equal "updated", @subshreddit.name
  end

  test "should destroy subshreddit" do
    sign_in users(:valid)
    assert_difference('Subshreddit.count', -1) do
      delete subshreddit_url(@subshreddit)
    end
 
    assert_redirected_to posts_path
  end

end
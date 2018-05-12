require 'test_helper'

class MessagesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  def setup
    @user = users(:valid)
    @user2 = users(:valid2)
    @message = messages(:one)
  end

  test "show all of a user's messages" do
    sign_in @user

    get user_profile_url(@user)
    assert_response :success
  end

  test "should not show all of a user's messages if user is not signed in" do
    sign_out @user

    get user_profile_url(@user)
    assert_redirected_to(new_user_session_path)
  end

  test "should show a single message" do
    sign_in @user
    @message = Message.create!(subject: 'hi', body: 'how are you?',
                               sender_id: @user.id, recipient_id: @user2.id)

    get message_url(@message)
    assert_response :success
  end

  test "should create a new message" do
    sign_in @user

    assert_difference('Message.count') do
      post user_messages_url(user_id: @user.id), params: { message: { subject: @message.subject, body: @message.body,
                                   sender_id: @user.id, recipient_id: @user2.id } }
    end

    assert_redirected_to(Message.last)
  end

  test "should destroy message" do
    sign_in @user
    @message = Message.create!(subject: 'hi', body: 'how are you?',
                               sender_id: @user.id, recipient_id: @user2.id)
    
    assert_difference('Message.count', -1) do
      delete message_url(@message)
    end
 
    assert_redirected_to user_profile_path(@user)
  end

end
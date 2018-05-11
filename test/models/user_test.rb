require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'valid user' do
  	@user = User.new(email: 'test@example.com', nick: 'tester',
  	 								password: 'password', password_confirmation: 'password')
  	assert @user.valid?
  end

  test 'invalid without nick' do
  	@user = User.new(email: 'test@example.com', password: 'password', 
  									 password_confirmation: 'password')
  	refute @user.valid?, 'user is valid without a nick'
  	assert_not_nil @user.errors[:nick], 'no validation error for nick present'
  end

  test 'invalid if nick is not unique' do
  	@user = User.new(email: 'test@example.com', password: 'password', 
  									 password_confirmation: 'password', nick: 'tester')
  	@user2 = User.new(email: 'test1@example.com', password: 'password'
  										password_confirmation: 'password', nick: 'tester')
  	refute @user.valid?, 'user is valid with an existing nick'
  	assert_not_nil @user.errors[:nick], 'no validation error for nick present'
  	
  end

  test 'invalid without email' do
  	@user = User.new(nick: 'John')
    refute @user.valid?
    assert_not_nil @user.errors[:email]
  end
end
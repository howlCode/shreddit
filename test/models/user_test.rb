require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def setup
    @user = users(:valid)
    @user2 = users(:valid2)
  end

  test 'valid user' do
  	assert @user.valid?
    assert @user2.valid?
  end

  test 'invalid without nick' do
    @user.nick = nil
  	refute @user.valid?, 'user is valid without a nick'
  	assert_not_nil @user.errors[:nick], 'no validation error for nick present'
  end

  test 'invalid if nick is not unique' do
  	@user_copy = User.new(@user.attributes)
    refute @user_copy.valid?
  end

  test 'invalid without email' do
    @user.email = nil
    refute @user.valid?
    assert_not_nil @user.errors[:email]
  end
end
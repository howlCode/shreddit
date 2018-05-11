require 'test_helper'

class SubshredditTest < ActiveSupport::TestCase

  def setup
    @subshreddit = subshreddits(:one)
  end
  
  test 'valid subshreddit' do
    assert @subshreddit.valid?
  end

  test 'invalid if name is not unique' do
    @subshreddit_copy = Subshreddit.new(@subshreddit.attributes)
    refute @subshreddit_copy.valid?
  end

  test 'invalid without name' do
    @subshreddit.name = nil
    refute @subshreddit.valid?
    assert_not_nil @subshreddit.errors[:name]
  end

end

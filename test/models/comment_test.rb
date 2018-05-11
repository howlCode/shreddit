require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  
  def setup
    @comment = comments(:one)
  end

  test 'valid comment' do
    assert @comment.valid?
  end

end

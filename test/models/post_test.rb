require 'test_helper'

class PostTest < ActiveSupport::TestCase
  
  def setup
    @post = posts(:one)
  end
  
  test 'valid post' do
    assert @post.valid?
  end

end

require 'test_helper'

class ProfileTest < ActiveSupport::TestCase
  
  def setup
    @profile = profiles(:one)
  end
  
  test 'valid profile' do
    assert @profile.valid?
  end

end

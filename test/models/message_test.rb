require 'test_helper'

class MessageTest < ActiveSupport::TestCase
  
  def setup
    @recipient = users(:valid)
    @sender = users(:valid2)
    @message = Message.new(subject: "Hi", body: "Hello", 
                          recipient_id: @recipient.id, sender_id: @sender.id)
  end
  
  test 'valid message' do
    assert @message.valid?
  end

end

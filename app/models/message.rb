class Message < ApplicationRecord
  belongs_to :user

  def message_sent_time
		if self[:created_at] == Date.today
			self[:created_at].strftime("%I:%M%P")
		else
			self[:created_at].strftime("%b %d %r")
		end
	end

end

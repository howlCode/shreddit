class Message < ApplicationRecord
  belongs_to :recipient, class_name: "User", foreign_key: "recipient_id"
  belongs_to :sender, class_name: "User", foreign_key: "sender_id"
  validates :subject, :body, presence: true

  def message_sent_time
		if self[:created_at] == Date.today
			self[:created_at].strftime("%I:%M%P")
		else
			self[:created_at].strftime("%b %d %r")
		end
	end

end
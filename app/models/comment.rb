class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post
  validates :body, presence: true

  def posted_time
		if self[:created_at] == Date.today
			self[:created_at].strftime("%I:%M%P")
		else
			self[:created_at].strftime("%b %d %r")
		end
	end
	
end

class Post < ApplicationRecord
  belongs_to :user
  belongs_to :subshreddit
  has_many :comments, dependent: :destroy
	default_scope -> { order(created_at: :desc) }
	validates :title, presence: true

	def posted_time
		if self[:created_at] == Date.today
			self[:created_at].strftime("%I:%M%P")
		else
			self[:created_at].strftime("%b %d %r")
		end
	end

	def comment_count
		if self.comments.count == 1
			"#{self.comments.count} comment"
		else
			"#{self.comments.count} comments"
		end
	end
	
end

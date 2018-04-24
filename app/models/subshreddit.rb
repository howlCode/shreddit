class Subshreddit < ApplicationRecord
  validates :name, presence: true
	validates :name, uniqueness: true
	belongs_to :user
	has_many :posts, dependent: :destroy
end

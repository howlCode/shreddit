class User < ApplicationRecord
	after_create :create_profile
	has_many :subshreddits
	has_many :posts, dependent: :destroy
	has_many :comments, dependent: :destroy
	has_one :profile, dependent: :destroy
	has_many :messages, class_name: "Message", foreign_key: "recipient_id"
  has_many :sent_messages, class_name: "Message", foreign_key: "sender_id"

  validates :nick, presence: true
  validates :nick, uniqueness: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end

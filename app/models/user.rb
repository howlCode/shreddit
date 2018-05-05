class User < ApplicationRecord
	after_create :create_profile
	has_many :subshreddits
	has_many :posts, dependent: :destroy
	has_many :comments, dependent: :destroy
  has_many :messages
	has_one :profile, dependent: :destroy

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end

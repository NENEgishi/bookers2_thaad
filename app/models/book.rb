class Book < ApplicationRecord
	belongs_to :user
	has_many :likes
	has_many :comments
	def liked_by?(user)
		likes.where(user_id: user.id).exists?
	end

	def commented_by?(user)
		comments.where(user_id: user.id).exists?
	end

	validates :title, presence: true
	validates :body, presence: true,  length: { maximum: 200 }
end

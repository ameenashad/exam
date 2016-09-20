class Question < ApplicationRecord

	belongs_to :user
	has_many :comments, as: :commentable
	has_many :answers


	validates :title, presence: true, format: { with: /^[a-z0-9 ]+$/i, :multiline => true }
	validates :description, presence: true
	validates :category, presence: true
end

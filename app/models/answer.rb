class Answer < ApplicationRecord
	has_many :comments, as: :commentable
	belongs_to :question
	belongs_to :user

	validates :description, presence: true
end

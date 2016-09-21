class Question < ApplicationRecord

	DefaultCategoryName = "no category"

	belongs_to :user
	has_many :comments, as: :commentable
	has_many :answers
	belongs_to :category

	validates :title, presence: true, format: { with: /^[a-z0-9 ]+$/i, :multiline => true }
	validates :description, presence: true

	before_save :capitalize


	def capitalize
		if self.title_changed?
			self.title = title.titleize
		end
	end

	def category_name
		# return either category name or "no category"
		category.try(:name) || DefaultCategoryName
		# if category.present?
		# 	category.name
		# else
		# 	"no category"
		# end
	end
end

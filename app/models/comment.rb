class Comment < ApplicationRecord
	belongs_to :commentable, polymorphic: true
	belongs_to :user


	validates :content, presence: true
	validates :user_id, presence: true

	before_save :changetext

	def changetext
		self.content.gsub(/WTF/i,"***")
			
	end
	
end

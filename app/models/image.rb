class Image < ActiveRecord::Base
	has_many :comments

	before_destroy :clear_comments, dependent: :destroy

	protected
	def clear_comments
		comments.clear
	end
end

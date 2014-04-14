class Image < ActiveRecord::Base
  scope :recent, where("created_at <= ?", Time.now)
	has_many :comments, dependent: :destroy
	before_destroy :clear_comments

	protected
	def clear_comments
		comments.clear
	end
end

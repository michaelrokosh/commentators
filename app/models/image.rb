class Image < ActiveRecord::Base
  scope :recent, where("created_at <= ?", Time.now)
	has_many :comments
	before_destroy :clear_comments, dependent: :destroy

	protected
	def clear_comments
		comments.clear
	end
end

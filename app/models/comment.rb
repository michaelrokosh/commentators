class Comment < ActiveRecord::Base

	belongs_to :image
	belongs_to :user
	has_many :votes, as: :voteable
end

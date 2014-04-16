class Image < ActiveRecord::Base
  scope :recent, where("created_at <= ?", Time.now)
	has_many :comments, dependent: :destroy
	before_destroy :clear_comments

  has_attached_file :image, styles: {
      thumb: '100x100>',
      square: '200x200#',
      medium: '500x500>'
    }

  # Validate the attached image is image/jpg, image/png, etc
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
	protected
	def clear_comments
		comments.clear
	end
end

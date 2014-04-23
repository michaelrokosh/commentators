class Image < ActiveRecord::Base
  scope :recent, where("created_at <= ?", Time.now)
	has_many :comments, dependent: :destroy
  belongs_to :user
	before_destroy :clear_comments

  has_attached_file :image, styles: {
      thumb: '100x100>',
      square: '200x200#',
      medium: '600x600>'
    }

  validates_attachment_size :image, :less_than => 1.megabytes, message: "Файл весит больше 1 МБ!"

  # Validate the attached image is image/jpg, image/png, etc
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/, message: "Загружать можно только изображения и gif-анимации!"
  def godno
    self.godnota = true
    self.created_at = Time.now
    self.save
  end
  
	protected
	def clear_comments
		comments.clear
	end
end

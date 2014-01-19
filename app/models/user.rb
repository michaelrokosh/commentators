class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable
  has_many :comments
  has_many :images
  has_many :votes, as: :voter

  def self.find_for_vkontakte_oauth access_token
    if user = User.where(url: access_token.info.urls.Vkontakte).first
      user
    else 
      User.create!(provider: access_token.provider, url: access_token.info.urls.Vkontakte, avatar_url: access_token.info.image, avatar_big_url: access_token.extra.raw_info.photo_big, username: access_token.info.name, email: access_token.extra.raw_info.screen_name + '@vk.com', nickname: access_token.extra.raw_info.screen_name, password: Devise.friendly_token[0,20]) 
    end
  end

  def voted_for?(voteable)
    votes.where(voteable_id: voteable).first.present?
  end

  def positive_vote?(voteable)
    votes.where(voteable_id: voteable).first.rate == 1
  end
end

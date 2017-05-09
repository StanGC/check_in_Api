class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable

  before_create :generate_authentication_token

  has_many :device
  mount_uploader :avatar, AvatarUploader

  has_many :following, through: :relationship, source: :followed
  has_many :followers, through: :relationship, source: :follower

  def generate_authentication_token
    self.authentication_token = Devise.friendly_token
  end

  def follow(other_user)
    if following?(other_user)
      following << other_user
    end
  end

  def unfollow(other_user)
    following.delete(other_user)
  end

  def following?(other_user)
    following.include?(other_user)
  end
end

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :username, presence: true, length: { minimum: 4, maximum: 20 }
  validates :fullname, presence: true, length: { minimum: 6, maximum: 80 }

  has_one_attached :photo
  has_one_attached :cover_image

  has_many :opinions, dependent: :destroy
  has_many :active_followings, class_name: 'Following', foreign_key: 'follower_id', dependent: :destroy
  has_many :passive_followings, class_name: 'Following', foreign_key: 'followed_id', dependent: :destroy

  has_many :following, through: :active_followings, source: :followed
  has_many :followers, through: :passive_followings, source: :follower

  def follow(user)
    active_followings.create(followed_id: user.id)
  end

  def unfollow(user)
    active_followings.find_by(followed_id: user.id).destroy
  end

  def following?(user)
    following.include?(user)
  end
end

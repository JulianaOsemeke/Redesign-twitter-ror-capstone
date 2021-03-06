class Following < ApplicationRecord
  belongs_to :follower, class_name: 'User'
  belongs_to :followed, class_name: 'User'

  validates :follower_id, presence: true
  validates :followed_id, presence: true

  scope :can_follow, ->(user) { where.not(follower_id: user.id) }
end

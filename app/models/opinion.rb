class Opinion < ApplicationRecord
  validates :opinion, presence: true, length: { maximum: 280 }
  belongs_to :author, class_name: 'User', foreign_key: :user_id
end

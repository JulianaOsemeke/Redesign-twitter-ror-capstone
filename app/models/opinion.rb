# frozen_string_literal: true

class Opinion < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: :user_id
end

# frozen_string_literal: true

class AddFieldToOpinions < ActiveRecord::Migration[6.1]
  def change
    add_column :opinions, :user_id, :integer
  end
end

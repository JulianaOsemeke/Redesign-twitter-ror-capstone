# frozen_string_literal: true

class AddFieldToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :username, :string
    add_column :users, :fullname, :string
  end
end

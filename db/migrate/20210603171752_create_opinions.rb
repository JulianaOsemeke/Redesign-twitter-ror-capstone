# frozen_string_literal: true

class CreateOpinions < ActiveRecord::Migration[6.1]
  def change
    create_table :opinions do |t|
      t.text :opinion

      t.timestamps
    end
  end
end

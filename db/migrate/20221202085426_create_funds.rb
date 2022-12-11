# frozen_string_literal: true

class CreateFunds < ActiveRecord::Migration[7.0]
  def change
    create_table :funds do |t|
      t.string :title, index: { unique: true }
      t.integer :total

      t.timestamps
    end
  end
end

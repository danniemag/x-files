# frozen_string_literal: true

class CreateProjects < ActiveRecord::Migration[7.0]
  def change
    create_table :projects do |t|
      t.string :title, index: { unique: true }
      t.references :fund, null: false, foreign_key: true

      t.timestamps
    end
  end
end

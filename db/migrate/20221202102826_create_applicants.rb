# frozen_string_literal: true

class CreateApplicants < ActiveRecord::Migration[7.0]
  def change
    create_table :applicants do |t|
      t.string :name, index: { unique: true }
      t.text :overview
      t.integer :funding
      t.references :project, null: false, foreign_key: true
      t.integer :status

      t.timestamps
    end
  end
end

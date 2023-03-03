# frozen_string_literal: true

class CreateStatusChangelogs < ActiveRecord::Migration[7.0]
  def change
    create_table :status_changelogs do |t|
      t.string :previous_status, null: false
      t.string :next_status, null: false
      t.text :reason, null: false
      t.references :applicant, null: false, foreign_key: true

      t.timestamps
    end
  end
end

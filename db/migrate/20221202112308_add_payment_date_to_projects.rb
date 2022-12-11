# frozen_string_literal: true

class AddPaymentDateToProjects < ActiveRecord::Migration[7.0]
  def change
    add_column :projects, :payment_date, :date
  end
end

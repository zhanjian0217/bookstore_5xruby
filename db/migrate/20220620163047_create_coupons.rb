# frozen_string_literal: true

class CreateCoupons < ActiveRecord::Migration[6.1]
  def change
    create_table :coupons do |t|
      t.string :title
      t.string :code
      t.integer :discount
      t.string :status, default: 'unused'
      t.integer :user_id
      t.integer :order_id
      t.datetime :start_time, default: -> { 'NOW()' }
      t.datetime :end_time

      t.timestamps
    end
  end
end

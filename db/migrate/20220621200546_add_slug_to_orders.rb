# frozen_string_literal: true

class AddSlugToOrders < ActiveRecord::Migration[6.1]
  def change
    add_column :orders, :slug, :string
  end
end

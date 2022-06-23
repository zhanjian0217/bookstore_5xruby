# frozen_string_literal: true

class Product < ApplicationRecord
  # validates
  validates :title, presence: true
  validates :price, presence: true
end

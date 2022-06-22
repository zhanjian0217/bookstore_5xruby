class Coupon < ApplicationRecord
  #relationship
  belongs_to :user, optional: true

  # validates
  validates :title, presence: true
  validates :discount, presence: true
end

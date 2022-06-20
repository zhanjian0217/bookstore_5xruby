class Coupon < ApplicationRecord
  #relationship
  belongs_to :user, optional: true
end

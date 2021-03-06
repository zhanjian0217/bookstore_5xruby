# frozen_string_literal: true

class Order < ApplicationRecord
  include AASM

  aasm column: 'status' do
    state :pending, initial: true
    state :paid

    event :pay do
      transitions from: :pending, to: :paid
    end
  end

  # relationship
  belongs_to :user
  has_one :coupon
end

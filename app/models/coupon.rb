# frozen_string_literal: true

class Coupon < ApplicationRecord
  # relationship
  belongs_to :user, optional: true

  # validates
  validates :title, presence: true
  validates :discount, presence: true

  # scope
  scope :ordered, -> { includes(:user).order(:status, id: :desc) }
end

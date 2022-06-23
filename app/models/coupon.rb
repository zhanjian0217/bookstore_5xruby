# frozen_string_literal: true

class Coupon < ApplicationRecord
  include AASM
  # relationship
  belongs_to :user, optional: true
  belongs_to :order, optional: true


  aasm column: 'status' do
    state :unused, initial: true
    state :used, :expired

    event :use do
      transitions from: :unused, to: :used
    end

    event :expire do
      transitions from: [:unused, :expired], to: :expired
    end
  end

  # validates
  validates :title, presence: true
  validates :discount, presence: true

  # callback
  after_find do |coupon|
    if coupon.end_time && coupon.end_time <= Time.current
      coupon.expire!
    end
  end

  # scope
  scope :ordered, -> { includes(:user).order(:status, id: :desc) }

  def coupon_status(status)
    case status
    when 'unused'
      '未使用'
    when 'used'
      '已使用'
    when 'expired'
      '已到期'
    end
  end
end

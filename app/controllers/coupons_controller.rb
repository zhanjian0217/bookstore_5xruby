# frozen_string_literal: true

class CouponsController < BaseController
  before_action :find_coupon, only: [:update]
  before_action :authenticate_user!

  def index
    @coupons = Coupon.where(user_id: nil, status: 'unused')
  end

  def update
    if @coupon.update(user: current_user)
      redirect_to coupons_path, notice: '成功領取折價券！'
    else
      redirect_to coupons_path, notice: '請再重新嘗試！'
    end
  end

  def mycoupons
    @my_coupons = current_user.coupons.unused
  end

  private

  def coupon_params
    params.require(:coupon).permit(:title, :discount, :code)
  end

  def find_coupon
    @coupon = Coupon.find(params[:id])
  end
end

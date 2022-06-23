# frozen_string_literal: true

module Admin
  class CouponsController < Admin::BaseController
    before_action :find_coupon, only: [:destroy]

    def index
      @coupons = Coupon.ordered
    end

    def new
      @coupon = Coupon.new
    end

    def create
      @coupon = Coupon.new(coupon_params)
      if @coupon.save
        redirect_to admin_coupons_path, notice: '新增折價券成功！'
      else
        redner :new
      end
    end

    def destroy
      @coupon.destroy
      redirect_to admin_coupons_path, alert: '刪除折價券成功！'
    end

    private

    def coupon_params
      params.require(:coupon).permit(:title, :discount, :code)
    end

    def find_coupon
      @coupon = Coupon.find(params[:id])
    end
  end
end

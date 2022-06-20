class Admin::CouponsController < ApplicationController
  before_action :authenticate_user!   
  before_action :authenticate_admin 

  def index
    @coupons = Coupon.all
  end

  def new
    @coupon = Coupon.new
  end

  def create
    @coupon = Coupon.new(coupon_params)
    if @coupon.save
      
    else
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def coupon_params
    params.require(:coupon).permit(:title, :discount, :code)
  end
end

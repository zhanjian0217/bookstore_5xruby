# frozen_string_literal: true

class CartsController < BaseController
  before_action :authenticate_user!
  def show
    @total_price = current_cart.total_price
  end

  def add
    current_cart.add_item(params[:id])
    session[:mycart] = current_cart.serialize

    redirect_to products_path, notice: '已加入購物車'
  end

  def remove
    current_cart.remove_item(params[:id])
    session[:mycart] = current_cart.serialize

    redirect_to cart_path, alert: '已成功刪除'
  end

  def destroy
    session[:mycart] = nil
    redirect_to cart_path, notice: '購物車已清空'
  end

  def mycoupon
    @total_price = current_cart.total_price
    if (@coupon = Coupon.find_by!(code: params[:code]))
      @total_price -= @coupon.discount
      @total_price = 1 if @total_price <= 0
      session[:discount_price] = @total_price
      session[:my_coupon] = @coupon.code
    else
      @total_price
    end
  end
end

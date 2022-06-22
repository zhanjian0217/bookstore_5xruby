class CartsController < ApplicationController
  before_action :authenticate_user!
  def show 
    @total_price = current_cart.total_price
  end

  def add
    current_cart.add_item(params[:id])
    session[:mycart] = current_cart.serialize

    redirect_to products_path, notice: "已加入購物車"
  end

  def remove
    current_cart.remove_item(params[:id])
    session[:mycart] = current_cart.serialize

    redirect_to cart_path, alert: "已成功刪除"
  end

  def destroy
    session[:mycart] = nil
    redirect_to cart_path, notice: "購物車已清空"
  end

  def mycoupon
    @coupon = Coupon.find_by(code: params[:coupon][:code])
    @total_price = current_cart.total_price
    @total_price = @total_price - @coupon.discount
  end
end

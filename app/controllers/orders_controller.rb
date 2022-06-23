# frozen_string_literal: true

class OrdersController < BaseController
  skip_before_action :verify_authenticity_token, only: [:payment_response] # 忽略外部網址 CSRF
  after_action :auto_sign_in, only: [:payment_response]
  after_action :session_clear, only: [:payment_response]

  def payment_response
    trade_info = Newebpay::MpgResponse.new(params[:TradeInfo])
    if trade_info.status == 'SUCCESS'
      @order = Order.find_by(slug: trade_info.order_no)
      @order.pay!
      @order.coupon.use!
      redirect_to root_path
    else
      redirect_to root_path, alert: '購買失敗，請確認有正確填寫付款資訊'
    end
  end

  def payment
    my_coupon = current_user.coupons.find_by(code: session[:my_coupon])
    @total_price = current_cart.total_price
    @total_price = session[:discount_price] if session[:discount_price]

    @order = Order.new(total_price: @total_price, user: current_user, slug: SecureRandom.hex(5))
    @order.total_price = session[:discount_price] if session[:discount_price]
    @order.coupon = my_coupon if my_coupon

    if @order.save
      @form_info = Newebpay::Mpg.new(@order).form_info
    else
      render file: "#{Rails.root}/public/500.html"
    end
  end

  def myorders
    @orders = current_user.orders
  end


  private

  def auto_sign_in
    sign_in @order.user
    flash[:notice] = "購買成功"
  end

  def session_clear
    session[:mycart] = nil
    session[:discount_price] = nil
  end
end

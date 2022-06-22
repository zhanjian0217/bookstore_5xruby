class OrdersController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:payment_response] #忽略外部網址 CSRF
  after_action :auto_sign_in, only:[:payment_response]


  def payment_response
    trade_info = Newebpay::MpgResponse.new(params[:TradeInfo])
    if trade_info.status == "SUCCESS"
      @order = Order.find_by(slug: trade_info.order_no) 
      @order.pay!
      session[:mycart] = nil
      redirect_to cart_path
    else
      redirect_to root_path, alert: "購買失敗，請確認有正確填寫付款資訊"
    end
  end

  def payment
    @total_price = current_cart.total_price
    if current_user
      order = Order.new(total_price: @total_price, user: current_user, slug: SecureRandom.hex(5))

      if order.save
        @form_info = Newebpay::Mpg.new(order).form_info
      else
        render file: "#{Rails.root}/public/500.html"
      end
    else
      redirect_to new_user_session_path, alert: "請先進行登入"
    end
  end

  private
  def auto_sign_in
    sign_in @order.user
  end
end

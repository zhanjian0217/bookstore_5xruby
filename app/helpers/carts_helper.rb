module CartsHelper
  def current_cart
    @cart ||= Cart.from_hash(session[:mycart])
  end
end

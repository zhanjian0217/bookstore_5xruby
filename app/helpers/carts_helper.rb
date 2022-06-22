module CartsHelper
  def current_cart
    @cart ||= Cart.from_hash(session[:mycart])
  end

  def cart_empty?
    session[:mycart].nil? ? "disabled" : ""
  end
end

# frozen_string_literal: true

class ProductsController < BaseController
  def index
    @products = Product.all
  end
end

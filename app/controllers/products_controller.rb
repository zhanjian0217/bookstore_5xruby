# frozen_string_literal: true

class ProductsController < BaseController
  def index
    @products = Product.all
  end

  def show; end

  private

  def find_product
    @product = Product.find_by(id: params[:id])
    redirect_to products_path, notice: '無此商品' unless @product
  end
end

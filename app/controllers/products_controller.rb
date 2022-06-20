class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def show
  end

  private
  def find_product
    @product = Product.find_by(id: params[:id])
    redirect_to products_path, notice: "無此商品" unless @product
  end

  def product_params
    params.require(:product).permit(:title, :description, :price)
  end
end

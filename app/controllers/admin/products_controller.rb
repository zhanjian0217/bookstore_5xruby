# frozen_string_literal: true

module Admin
  class ProductsController < Admin::BaseController
    before_action :find_product, only: %i[edit update destroy]

    def index
      @products = Product.order(id: :asc)
    end

    def new
      @product = Product.new
    end

    def create
      @product = Product.new(product_params)
      if @product.save
        redirect_to admin_products_path, notice: '新增商品完成'
      else
        render :new
      end
    end

    def edit; end

    def update
      if @product.update(product_params)
        redirect_to admin_products_path, notice: '商品更新成功'
      else
        render :edit
      end
    end

    def destroy
      @product.destroy
      redirect_to admin_products_path, notice: '商品已刪除'
    end

    private

    def find_product
      @product = Product.find_by(id: params[:id])
      redirect_to products_path, notice: '無此商品' unless @product
    end

    def product_params
      params.require(:product).permit(:title, :description, :price)
    end
  end
end

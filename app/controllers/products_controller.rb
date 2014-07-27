class ProductsController < ApplicationController
  def new
    @product = Product.new
  end

  def create
    product = Product.new(product_params)
    product.seller = current_user
    product.save
    redirect_to dashboard_path
  end

  private

  def product_params
    params.require(:product).permit(:name, :description, :asking_price, :auction_length)
  end
end

class BuysController < ApplicationController
  def create
    product = Product.find(params[:product_id])
    current_user.buys(product)
    redirect_to dashboard_path
  end
end

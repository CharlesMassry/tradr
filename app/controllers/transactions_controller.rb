class TransactionsController < ApplicationController
  def new
    @transaction = Transaction.new
    @product = Product.find(params[:product_id])
  end
end

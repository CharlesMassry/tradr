class User < ActiveRecord::Base
  validates :email, presence: true, uniqueness: true
  validates :password_digest, presence: true

  has_many :selling_products,
           class_name: "Product",
           foreign_key: :seller_id

  has_many :transactions, as: :sellers

  has_many :buying_products,
           class_name: "Product",
           foreign_key: :buyer_id

  has_many :transactions, as: :buyers

  def buys(product)
    Transaction.create(product: product,
                       seller: product.seller,
                       buyer: self)
  end
end

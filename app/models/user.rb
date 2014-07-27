class User < ActiveRecord::Base
  validates :email, presence: true, uniqueness: true
  validates :password_digest, presence: true

  has_many :selling_products,
           class_name: "Product",
           foreign_key: :seller_id

  has_many :sold_products, through: :selling_products

  has_many :buying_products,
           class_name: "Product",
           foreign_key: :buyer_id

  has_many :bought_products, through: :buying_products
end

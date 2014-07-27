class Product < ActiveRecord::Base
  belongs_to :buyer, class_name: "User"
  belongs_to :seller, class_name: "User"

  validates :name, presence: true
  validates :description, presence: true

  validates :asking_price, presence: true,
            numericality: { greater_than: 0, only_integer: true }

  validates :seller_id, presence: true
  validate :seller_cannot_be_buyer


  def time_left
    time = Time.at(auction_end_time) - Time.now
    time.to_i
  end


  def auction_end_time
    created_at + auction_days
  end

  def seller_cannot_be_buyer
    if seller_id == buyer_id
      errors.add("You can't buy your own product.")
    end
  end

  private

  def auction_days
    (60 * 60) * (24 * auction_length)
  end
end

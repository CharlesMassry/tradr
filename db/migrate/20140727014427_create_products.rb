class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.text :description, null: false
      t.decimal :asking_price, :decimal, null: false, precision: 8, scale: 2
      t.decimal :current_bid, :decimal, null: false, precision: 8, scale: 2
      t.integer :auction_length, default: 3, null: false
      t.references :buyer, index: true, null: false
      t.references :seller, index: true, null: false

      t.timestamps null: false
    end
  end
end

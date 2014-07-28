class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.belongs_to :buyer, index: true
      t.belongs_to :seller, index: true
      t.belongs_to :product, index: true

      t.timestamps
    end
  end
end

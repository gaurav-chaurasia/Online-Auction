class CreateBids < ActiveRecord::Migration[5.2]
  def change
    create_table :bids do |t|
      t.float :amount
      t.references :user, foreign_key: true
      t.references :auction, foreign_key: true

      t.timestamps
    end
  end
end

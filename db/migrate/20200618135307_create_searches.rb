class CreateSearches < ActiveRecord::Migration[5.2]
  def change
    create_table :searches do |t|
      t.string :keywords
      t.float :min_price
      t.float :max_price

      t.timestamps
    end
  end
end

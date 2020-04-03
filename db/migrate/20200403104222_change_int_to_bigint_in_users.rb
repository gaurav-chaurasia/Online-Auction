class ChangeIntToBigintInUsers < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :contact_number, :bigint
  end
end

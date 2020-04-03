class AddUserDetailsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :contact_number, :integer
    add_column :users, :address, :string
  end
end

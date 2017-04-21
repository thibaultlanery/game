class AddColumnsToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :firstname, :string
    add_column :users, :lastname, :string
    add_column :users, :address, :string
    add_column :users, :age, :integer
    add_column :users, :gender, :string
    add_column :users, :facebook_picture_url, :string
  end
end

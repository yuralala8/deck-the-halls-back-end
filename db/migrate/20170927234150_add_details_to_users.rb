class AddDetailsToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :bio, :string
    add_column :users, :pro_pic, :string
  end
end

class CreateUsersParties < ActiveRecord::Migration[5.1]
  def change
    create_table :users_parties do |t|
      t.integer :user_id
      t.integer :party_id

      t.timestamps
    end
  end
end

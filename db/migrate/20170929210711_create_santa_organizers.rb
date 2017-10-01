class CreateSantaOrganizers < ActiveRecord::Migration[5.1]
  def change
    create_table :santa_organizers do |t|
      t.integer :party_id
      t.integer :giver_id
      t.integer :receiver_id

      t.timestamps
    end
  end
end

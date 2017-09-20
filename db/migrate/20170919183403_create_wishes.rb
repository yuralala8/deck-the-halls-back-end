class CreateWishes < ActiveRecord::Migration[5.1]
  def change
    create_table :wishes do |t|
      t.string :item_name
      t.text :item_description
      t.string :item_link
      t.string :item_rank
      t.text :item_image
      t.string :item_price
      t.belongs_to :user

      t.timestamps
    end
  end
end

class CreateWishes < ActiveRecord::Migration[5.1]
  def change
    create_table :wishes do |t|
      t.string :item_name
      t.string :item_description
      t.string :item_link
      t.string :item_rank
      t.string :item_image
      t.string :item_price

      t.timestamps
    end
  end
end

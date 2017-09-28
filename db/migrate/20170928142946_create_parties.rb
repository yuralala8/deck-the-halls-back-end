class CreateParties < ActiveRecord::Migration[5.1]
  def change
    create_table :parties do |t|
      t.string :host_name
      t.string :location
      t.datetime :date
      t.string :amount
      t.string :comment

      t.timestamps
    end
  end
end

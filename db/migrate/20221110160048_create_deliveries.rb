class CreateDeliveries < ActiveRecord::Migration[6.0]
  def change
    create_table :deliveries do |t|
      t.string :description
      t.datetime :arrival_date
      t.text :details
      t.integer :owner_id

      t.timestamps
    end
  end
end

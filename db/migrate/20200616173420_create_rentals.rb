class CreateRentals < ActiveRecord::Migration[6.0]
  def change
    create_table :rentals do |t|
      t.string :name
      t.integer :bedrooms
      t.integer :price
      t.integer :units
      t.integer :contacts
      t.timestamps
    end
  end
end

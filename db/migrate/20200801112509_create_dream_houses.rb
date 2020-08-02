class CreateDreamHouses < ActiveRecord::Migration[6.0]
  def change
    create_table :dream_houses do |t|
      t.string :name
      t.integer :bedrooms
      t.integer :price
      t.integer :units
      t.integer :contacts
      t.integer :user_id
      t.integer :town_id
      t.integer :estate_id
      t.timestamps
    end
  end
end

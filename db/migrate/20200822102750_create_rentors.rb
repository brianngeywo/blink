class CreateRentors < ActiveRecord::Migration[6.0]
  def change
    create_table :rentors do |t|
      t.integer :user_id
      t.integer :rental_id
      t.timestamps
    end
  end
end

class CreateBooking < ActiveRecord::Migration[6.0]
  def change
    create_table :bookings do |t|
      t.integer :town_id
      t.string :location
      t.integer :rooms
      t.integer :rent
      t.text :infor
      t.string :name
      t.string :phone
    t.integer :user_id
    end
  end
end

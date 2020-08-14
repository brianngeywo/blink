class AddCarToBookings < ActiveRecord::Migration[6.0]
  def change
    add_column :bookings, :car, :string
    remove_column :bookings, :user_id
    #Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email")
  end
end

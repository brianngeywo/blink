class ChangeColumnsToBookings < ActiveRecord::Migration[6.0]
  def change
  change_column :bookings, :rent, :string
  change_column :bookings, :rooms, :string
  #Ex:- change_column("admin_users", "email", :string, :limit =>25)
  end
end

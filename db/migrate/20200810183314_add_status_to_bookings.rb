class AddStatusToBookings < ActiveRecord::Migration[6.0]
  def change
    add_column :bookings, :status, :integer
    #Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email")
  end
end

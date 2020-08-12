class AddMoreColumnsToRentals < ActiveRecord::Migration[6.0]
  def change
    add_column :rentals, :wifi, :string
    add_column :rentals, :bathrooms, :integer
    add_column :rentals, :parking, :integer
    #Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email")
    #Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email")
    #Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email")
  end
end

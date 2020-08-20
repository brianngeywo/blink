class ChangephoneinUser < ActiveRecord::Migration[6.0]
  def change
    rename_column :users, :phone, :phone_number
    change_column :users, :phone_number, :text
    #Ex:- change_column("admin_users", "email", :string, :limit =>25)
    #Ex:- rename_column("admin_users", "pasword","hashed_pasword")
    #Ex:- change_column("admin_users", "email", :string, :limit =>25)
  end
end

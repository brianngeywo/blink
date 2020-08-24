class AddStatusToRentors < ActiveRecord::Migration[6.0]
  def change
    add_column :rentors, :status, :integer
  end
end

class AddStatesToCustomers < ActiveRecord::Migration[6.0]
  def change
    add_column :customers, :status, :integer
  end
end

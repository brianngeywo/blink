class CreateRentalFeatures < ActiveRecord::Migration[6.0]
  def change
    create_table :rental_features do |t|
      t.string :name
      t.integer :rental_id
    end
  end
end

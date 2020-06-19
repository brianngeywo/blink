class CreateEstate < ActiveRecord::Migration[6.0]
  def change
    create_table :estates do |t|
      t.string :name
    end
  end
end

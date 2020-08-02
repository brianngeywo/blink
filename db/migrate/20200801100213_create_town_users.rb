class CreateTownUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :town_users do |t|
      t.integer :user_id
      t.integer :town_id
    end
  end
end

class AddLaundromatsTable < ActiveRecord::Migration
  def change
    create_table :laundromats do |t|
      t.string :name, null: false
      t.string :address, null: false
      t.string :city, null: false
      t.string :state, null: false, length: 2
      t.string :zip_code, null: false, length: 5
      t.integer :washers_available, null: false
      t.integer :dryers_available, null: false
      t.string :created_by, null: false

      t.timestamps null: false
    end
  end
end

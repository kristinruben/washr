class AddWashersTable < ActiveRecord::Migration
  def change
    create_table :washers do |t|
      t.boolean :in_use
      t.integer :time_left

      t.timestamps null: false
    end
  end
end

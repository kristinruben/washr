class AddDryersTable < ActiveRecord::Migration
  def change
    create_table :dryers do |t|
      t.boolean :in_use
      t.integer :time_left

      t.timestamps null: false
    end
  end
end

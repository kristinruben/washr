class AddColumnsToLaundromats < ActiveRecord::Migration
  def change
    add_column :laundromats, :washers, :integer
    add_column :laundromats, :dryers, :integer
  end
end

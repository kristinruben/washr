class RemoveColumnsLaundromats < ActiveRecord::Migration
  def change
    remove_column :laundromats, :washers_available, :integer
    remove_column :laundromats, :dryers_available, :integer
  end
end

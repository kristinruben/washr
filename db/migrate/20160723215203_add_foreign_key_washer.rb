class AddForeignKeyWasher < ActiveRecord::Migration
  def change
    add_column :washers, :laundromat_id, :integer
  end
end

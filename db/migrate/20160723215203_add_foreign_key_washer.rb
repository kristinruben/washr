class AddForeignKeyWasher < ActiveRecord::Migration
  def change
    add_column :washers, :laundromat_id, :string
  end
end

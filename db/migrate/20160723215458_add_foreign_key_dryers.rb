class AddForeignKeyDryers < ActiveRecord::Migration
  def change
    add_column :dryers, :laundromat_id, :integer
  end
end

class AddForeignKeyDryers < ActiveRecord::Migration
  def change
    add_column :dryers, :laundromat_id, :string
  end
end

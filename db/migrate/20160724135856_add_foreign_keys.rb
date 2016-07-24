class AddForeignKeys < ActiveRecord::Migration
  def change
    remove_column :washers, :laundromat_id, :string
    remove_column :dryers, :laundromat_id, :string
    add_column :washers, :laundromat_id, :integer, null: false
    add_column :dryers, :laundromat_id, :integer, null: false
    add_foreign_key :washers, :laundromats, null: false
    add_foreign_key :dryers, :laundromats, null: false
  end
end

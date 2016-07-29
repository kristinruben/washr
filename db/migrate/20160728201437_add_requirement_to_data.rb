class AddRequirementToData < ActiveRecord::Migration
  def change
    change_column :dryers, :laundromat_id, :integer, null: false
    change_column :washers, :laundromat_id, :integer, null: false
  end
end

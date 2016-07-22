class DeleteColumn < ActiveRecord::Migration
  def change
    remove_column :laundromats, :created_by, :string
  end
end

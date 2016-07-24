class ChangeWashersTable < ActiveRecord::Migration
  def change
    remove_column :washers, :in_use, :boolean
    remove_column :washers, :time_left, :integer
    add_column :washers, :number_available, :integer
  end
end

class ChangeDryersTable < ActiveRecord::Migration
  def change
    remove_column :dryers, :in_use, :boolean
    remove_column :dryers, :time_left, :integer
    add_column :dryers, :number_available, :integer
  end
end

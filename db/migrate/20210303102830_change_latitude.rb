class ChangeLatitude < ActiveRecord::Migration[6.1]
  def change
    remove_column :islands, :latitude
    add_column :islands, :latitude, :float
  end
end

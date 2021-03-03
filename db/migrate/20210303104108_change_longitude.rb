class ChangeLongitude < ActiveRecord::Migration[6.1]
  def change
    remove_column :islands, :longitude
    add_column :islands, :longitude, :float
  end
end

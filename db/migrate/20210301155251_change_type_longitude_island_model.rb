class ChangeTypeLongitudeIslandModel < ActiveRecord::Migration[6.1]
  def change
    change_column :islands, :longitude, :string
  end
end

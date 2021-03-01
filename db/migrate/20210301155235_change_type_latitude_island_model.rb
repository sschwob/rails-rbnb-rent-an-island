class ChangeTypeLatitudeIslandModel < ActiveRecord::Migration[6.1]
  def change
    change_column :islands, :latitude, :string
  end
end

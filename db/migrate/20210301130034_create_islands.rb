class CreateIslands < ActiveRecord::Migration[6.1]
  def change
    create_table :islands do |t|
      t.string :name
      t.string :country
      t.string :description
      t.integer :latitude
      t.integer :longitude
      t.integer :price_per_day
      t.integer :area
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end

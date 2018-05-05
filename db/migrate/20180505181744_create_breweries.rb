class CreateBreweries < ActiveRecord::Migration[5.1]
  def change
    create_table :breweries do |t|
      t.string :name, null: false

      t.timestamps
    end
    add_index :breweries, :name, unique: true
  end
end

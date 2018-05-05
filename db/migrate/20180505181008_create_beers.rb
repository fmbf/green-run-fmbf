class CreateBeers < ActiveRecord::Migration[5.1]
  def change
    create_table :beers do |t|
      t.string :name, null: false
      t.integer :brewery_id, null: false, index: true
      t.boolean :actively_brewed
      t.integer :ibu
      t.float :abv
      t.string :flavors
      t.string :last_tapped_on

      t.timestamps
    end
  end
end

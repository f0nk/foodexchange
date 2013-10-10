class CreateListings < ActiveRecord::Migration
  def up
  create_table :listings do |t|
      t.integer :user_id
      t.string :name
      t.string :region
      t.string :country
      t.string :category
      t.string :price
      t.string :imageurl

      t.timestamps
    end
  end

  def down
  	drop_table :listings
  end
end

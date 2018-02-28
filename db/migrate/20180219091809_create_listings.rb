class CreateListing < ActiveRecord::Migration[5.1]
  def change
    create_table :listings do |t|
    	t.string :title
    	t.string :description
    	t.string :location
    	t.integer :bedroom
    	t.integer :bathroom
    	t.integer :accomodate
    	t.boolean :entire_home, :default => false
    	t.text :amenities, :array => true, :default => []


      t.timestamps
    end
  end
end

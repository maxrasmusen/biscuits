class CreateBiscuits < ActiveRecord::Migration[5.1]
  def change
  	create_table :biscuits do |t|
  		t.string :name, null: false
  		t.string :text
  		t.integer :num_ratings
  		t.integer :rating_total
  		t.float :rating
  		t.string :image_url
  	end
  end
end

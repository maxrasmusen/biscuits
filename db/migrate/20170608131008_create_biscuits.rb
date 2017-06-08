class CreateBiscuits < ActiveRecord::Migration[5.1]
  def change
  	create_table :biscuits do |t|
  		t.string :name
  		t.string :text
  		t.integer :num_ratings
  		t.integer :rating_total
  	end
  end
end

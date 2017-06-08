class CreateBiscuits < ActiveRecord::Migration[5.1]
  def change
  	create_table :biscuits do |t|
  		t.string :name
  		t.string :text
  	end
  end
end

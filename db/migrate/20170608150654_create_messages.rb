class CreateMessages < ActiveRecord::Migration[5.1]
  def change
  	create_table :messages do |t|
  		t.string :user
  		t.string :text
  		t.integer :biscuit_id
  	end
  end
end

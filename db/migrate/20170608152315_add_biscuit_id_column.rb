class AddBiscuitIdColumn < ActiveRecord::Migration[5.1]
  def change
  	add_column :messages, :biscuit_id, :integer
  end
end

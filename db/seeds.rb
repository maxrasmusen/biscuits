require_relative '../models/biscuit.rb'
require_relative '../models/message.rb'

b1 = Biscuit.create(:name => "New mes Biscuit", :text => "biscuit text", :num_ratings => 1, :rating_total => 1, :image_url => "image path")

m1 = Message.create(:user => 'usr', :text => 'message text', :biscuit_id => b1.id)
m1 = Message.create(:user => 'usr2', :text => 'more message text', :biscuit_id => b1.id)

puts b1.messages
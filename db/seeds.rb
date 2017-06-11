require_relative '../models/biscuit.rb'
require_relative '../models/message.rb'

b1 = Biscuit.create(:name => "Custard Cream", :text => "Custard Creams are the best biscuit", :num_ratings => 0, :rating_total => 0, :image_url => "https://www.hillbiscuits.com/9-8-biscuit-image/hill-custard-creams-150g.jpg")

Message.create(:user => 'GoodPerson', :text => 'yes custard creams are very nice', :biscuit_id => b1.id)
Message.create(:user => 'Lucifer', :text => 'No ther not', :biscuit_id => b1.id)

b2 = Biscuit.create(:name => "Bourbon", :text => "Bourbons are also nice, especially if you like chocolate", :num_ratings => 0, :rating_total => 0, :image_url => "http://2.bp.blogspot.com/-ZGCofoDQayc/VXLPNwqfcrI/AAAAAAAAMFM/PTeAY8mSNu4/s1600/bourbon.jpg")

Message.create(:user => 'chocolate-person', :text => 'I like chocolate so bourbons are nice', :biscuit_id => b2.id)
Message.create(:user => 'also_likes-cohcoclate', :text => 'Yes they are', :biscuit_id => b2.id)

b3 = Biscuit.create(:name => "Nice", :text => "Very nice biscuit", :num_ratings => 0, :rating_total => 0, :image_url => "http://i.imgur.com/7n0SkSk.jpg")

Message.create(:user => 'Max', :text => 'Nice biscuits are tasty', :biscuit_id => b3.id)
Message.create(:user => 'Alice', :text => 'Yes they are', :biscuit_id => b3.id)

b4 = Biscuit.create(:name => "Digestive", :text => "Very common	 biscuit", :num_ratings => 0, :rating_total => 0, :image_url => "http://i.imgur.com/8D7Y3Ff.jpg")

b5 = Biscuit.create(:name => "Hobnob", :text => "OK I guess", :num_ratings => 0, :rating_total => 0, :image_url => "http://i.imgur.com/lWAyJyB.jpg")
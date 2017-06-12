class MessagesController < Sinatra::Base

	# sets root as the parent-directory of the current file
  	set :root, File.join(File.dirname(__FILE__), '..')
  
  	# sets the view directory correctly
  	set :views, Proc.new { File.join(root, "views") } 

  	configure :development do
    	register Sinatra::Reloader
  	end

  	# INDEX

	get "/messages" do
		messages = Message.all
		"#{messages}"
	end

	# NEW
	 get "/messages/new" do 
	 	"MESSAGES CREATION DONE ON BISCUIT PAGES"
	 end

	# SHOW
	 get "/messages/:id" do
	 	@message = Message.find(params[:id].to_i)
	 	"#{@message.text}"
	 end

	 # CREATE 
	 post "/messages" do 
	 	puts 'creating message'
	 	puts params
	 	Message.create(:user => params[:user], :text => params[:text], :biscuit_id => params[:biscuit_id].to_i)	
	 	"message recieved"
	 end

	 # UPDATE
	 put "/messages/:id" do 
	 	"CAN'T CHANGE MESSAGES"
	 end

	 # DELETE
	 delete "/messages/:id" do 
	 	"CAN'T DELETE MESSAGES"
	 end

	 # EDIT
	 get "/messages/:id/edit" do 
	 	"CAN'T CHANGE MESSAGES"
	 end
end
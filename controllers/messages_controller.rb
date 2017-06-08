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
		@messages = Message.all
		erb :"messages/index"
	end

	# NEW
	 get "/messages/new" do 
	 	erb :"messages/new"
	 end

	# SHOW
	 get "/messages/:id" do
	 	@message = Message.find(params[:id].to_i)
	 	erb :"messages/show"
	 end

	 # CREATE 
	 post "/messages" do 
	 	puts 'creating message'
	 	Message.create(:user => params[:user], :text => params[:text])	
	 	redirect '/messages'
	 end

	 # UPDATE
	 put "/messages/:id" do 
	 	Message.update(params[:id].to_i, :name => params[:user], :text => params[:text])
	 	redirect "/messages"
	 end

	 # DELETE
	 delete "/messages/:id" do 
	 	"DELETE"
	 end

	 # EDIT
	 get "/messages/:id/edit" do 
	 	@message = Message.find(params[:id].to_i)
	 	erb :"messages/edit"
	 end
end
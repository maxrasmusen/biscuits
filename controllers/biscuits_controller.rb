class BiscuitsController < Sinatra::Base

	# sets root as the parent-directory of the current file
  	set :root, File.join(File.dirname(__FILE__), '..')
  
  	# sets the view directory correctly
  	set :views, Proc.new { File.join(root, "views") } 

  	configure :development do
    	register Sinatra::Reloader
  	end


  	# INDEX
	get "/biscuits" do
		@popular_biscuit_list = Biscuit.popular_biscuit_list
		@top_biscuit_list = Biscuit.top_biscuit_list
		@biscuits = Biscuit.all
		@messages = Message.all
		@biscuit_names = Biscuit.names_as_hash

		erb :"biscuits/index"
	end

	# SEARCH
	 get "/biscuits/search" do
	 	@biscuits = Biscuit.search_for_biscuit params
		@biscuit_list = Biscuit.biscuit_list
		@messages = Message.all
	 	erb :"biscuits/index"
	 end

	# NEW
	 get "/biscuits/new" do 
		@biscuit_list = Biscuit.biscuit_list
	 	erb :"biscuits/new"
	 end

	# SHOW
	 get "/biscuits/:id" do
	 	@biscuit = Biscuit.find(params[:id].to_i)
		@popular_biscuit_list = Biscuit.popular_biscuit_list
		@top_biscuit_list = Biscuit.top_biscuit_list
	 	erb :"biscuits/show"
	 end

	 # CREATE 
	 post "/biscuits" do 
		@biscuit_list = Biscuit.biscuit_list
	 	Biscuit.create_biscuit params
	 	redirect '/biscuits'
	 end

	 # UPDATE
	 put "/biscuits/:id" do 
		@biscuit_list = Biscuit.biscuit_list
		Biscuit.update_biscuit params
	 	redirect "/biscuits/#{params[:id]}"
	 end

	 # RATE
	 post "/biscuits/:id/rate" do 
	 	Biscuit.rate_biscuit params
	 	redirect "/biscuits/#{params[:id]}"
	 end

	 # DELETE
	 delete "/biscuits/:id" do 
		@biscuit_list = Biscuit.biscuit_list
	 	Biscuit.destroy(params[:id].to_i)
	 	redirect "/biscuits"
	 end

	 # EDIT
	 get "/biscuits/:id/edit" do 
		@biscuit_list = Biscuit.biscuit_list
	 	@biscuit = Biscuit.find(params[:id].to_i)
	 	erb :"biscuits/edit"
	 end
end
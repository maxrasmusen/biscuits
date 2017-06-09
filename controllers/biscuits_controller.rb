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
		@biscuits = Biscuit.all
		@messages = Message.all
		erb :"biscuits/index"
	end

	# NEW
	 get "/biscuits/new" do 
	 	erb :"biscuits/new"
	 end

	# SHOW
	 get "/biscuits/:id" do
	 	@biscuit = Biscuit.find(params[:id].to_i)
	 	erb :"biscuits/show"
	 end

	 # CREATE 
	 post "/biscuits" do 
	 	image_url = Biscuit.upload_image params
	 	Biscuit.create(:name => params[:name], :text => params[:text], :num_ratings => 0, :rating_total => 0, :image_url => image_url)	
	 	redirect '/biscuits'
	 end

	 # UPDATE
	 put "/biscuits/:id" do 
	 	image_url = Biscuit.upload_image params
	 	b = Biscuit.find(params[:id].to_i)
	 	Biscuit.update(params[:id].to_i, :name => params[:name], :text => params[:text])
	 	Biscuit.update(params[:id].to_i, :image_url => image_url) if image_url != nil
	 	Biscuit.update(params[:id], :rating_total => b.rating_total+ params[:rating].to_i, :num_ratings => b.num_ratings + 1) if params.key?("rating")
	 	redirect "/biscuits"
	 end

	 # DELETE
	 delete "/biscuits/:id" do 
	 	Biscuit.destroy(params[:id].to_i)
	 	redirect "/biscuits"
	 end

	 # EDIT
	 get "/biscuits/:id/edit" do 
	 	@biscuit = Biscuit.find(params[:id].to_i)
	 	erb :"biscuits/edit"
	 end
end
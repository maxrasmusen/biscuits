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
	 	Biscuit.create(:name => params[:name], :text => params[:text], :num_ratings => 1, :rating_total => 1)
	 	redirect '/biscuits'
	 end

	 # UPDATE
	 put "/biscuits/:id" do 
	 	Biscuit.update(params[:id].to_i, :name => params[:name], :text => params[:text])
	 	redirect "/biscuits"
	 end

	 # DELETE
	 delete "/biscuits/:id" do 
	 	"DELETE"
	 end

	 # EDIT
	 get "/biscuits/:id/edit" do 
	 	@biscuit = Biscuit.find(params[:id].to_i)
	 	erb :"biscuits/edit"
	 end
end
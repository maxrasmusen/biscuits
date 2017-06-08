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

	# SHOW
	 get "/biscuits/:id" do
	 	"SHOW"
	 end

	 # CREATE 
	 post "/biscuits" do 
	 	"CREATE"
	 end

	 # UPDATE
	 put "/biscuits/:id" do 
	 	"UPDATE"
	 end

	 # DELETE
	 delete "/biscuits/:id" do 
	 	"DELETE"
	 end

	 # NEW
	 get "/biscuits/new" do 
	 	"NEW"
	 end

	 # EDIT
	 get "/biscuits/:id/edit" do 
	 	"EDIT"
	 end
end
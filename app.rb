require 'sinatra/reloader' if development?

#Load Controllers
Dir[File.dirname(__FILE__) + '/controllers/*.rb'].each {|file| require file}

get '/' do 
	erb :home
end

use BiscuitsController


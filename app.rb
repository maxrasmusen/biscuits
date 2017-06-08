require 'sinatra/reloader' if development?

#Load Models
Dir[File.dirname(__FILE__) + '/models/*.rb'].each {|file| require file}

#Load Controllers
Dir[File.dirname(__FILE__) + '/controllers/*.rb'].each {|file| require file}

get '/' do 
	erb :home
end

use BiscuitsController
use MessagesController


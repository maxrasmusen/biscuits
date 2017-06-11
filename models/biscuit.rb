class Biscuit < ActiveRecord::Base
	has_many :messages

	def self.upload_image params
		return nil if !params.key?("img")
		file = params[:img][:tempfile]		
		client_id = 'bb856e82bdce476'
		client_secret = 'ea7a14f342fe4cbc8bdbeeb22fe7ff764711f1a2'
		refresh_token = '7ce755e18d5fdc8fd153cc62b24ae6bf058d076f'
		access_token = '154dfce54b5eb89dd909334071ce96de00c301dd'
		imgur_session = Imgurapi::Session.new(client_id: client_id, client_secret: client_secret, refresh_token: refresh_token, access_token: access_token)
		image = imgur_session.image.image_upload(file)
		return image.link
		return " sdfa "
	end

	def self.biscuit_list 
		@biscuit_list = Biscuit.order(num_ratings: :desc).limit(5)
	end

	def self.names_as_hash
		Biscuit.select(:id, :name).as_json.map {|elem| {"#{elem["id"]}" => "#{elem["name"]}"}}.inject {|prev, nex| prev.merge nex}
	end

end
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

	def self.update_biscuit params
		image_url = Biscuit.upload_image params
	 	b = Biscuit.find(params[:id].to_i)
	 	Biscuit.update(params[:id].to_i, :name => params[:name], :text => params[:text])
	 	Biscuit.update(params[:id].to_i, :image_url => image_url) if image_url != nil
	end

	def self.rate_biscuit params
		if params.key?("rating")
			b = Biscuit.find(params[:id].to_i)
			new_total_rating = b.rating_total+ params[:rating].to_i
			new_rating = new_total_rating.to_f / (b.num_ratings + 1).to_f
	 		Biscuit.update(params[:id], :rating_total => new_total_rating, :num_ratings => b.num_ratings + 1, :rating => new_rating)
		end
	end

	def self.create_biscuit params
		image_url = Biscuit.upload_image params
	 	Biscuit.create(:name => params[:name], :text => params[:text], :num_ratings => 0, :rating_total => 0, :image_url => image_url)
	end

	def self.search_for_biscuit params
		search = Biscuit.ransack(name_cont: params[:q])
	 	return search.result.to_a
	end

end
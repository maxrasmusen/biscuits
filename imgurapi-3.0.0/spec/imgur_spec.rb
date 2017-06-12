require File.expand_path(File.dirname(__FILE__) + '/spec_helper')
require 'imgur'

describe Imgurapi do

  describe 'placeholder classes' do

    it 'should create an Image with the fields provided' do
      image = Imgurapi::Image.new
      image.should be_an_instance_of Imgurapi::Image

      fields = {:a => 1, :b => 2}
      image = Imgurapi::Image.new(fields)
      image.should be_an_instance_of Imgurapi::Image
      image.a.should eq(1)
      image.b.should eq(2)
    end

    it 'should create a Link with the fields provided' do
      links = Imgurapi::Links.new
      links.should be_an_instance_of Imgurapi::Links

      fields = {:a => 1, :b => 2}
      links = Imgurapi::Links.new(fields)
      links.should be_an_instance_of Imgurapi::Links
      links.a.should eq(1)
      links.b.should eq(2)
    end

  end

  describe 'api' do

    it 'should return a download URL' do
      imgur_hash = 'random_valid_hash'

      @session.url(:foo).should eq('')
      @session.url().should eq('')
      @session.url(imgur_hash).should eq("http://i.imgur.com/#{imgur_hash}.jpg")
      @session.url(imgur_hash, :random_size).should eq("http://i.imgur.com/#{imgur_hash}.jpg")
      @session.url(imgur_hash, :small_square).should eq("http://i.imgur.com/#{imgur_hash}s.jpg")
      @session.url(imgur_hash, :large_thumbnail).should eq("http://i.imgur.com/#{imgur_hash}l.jpg")
    end

  end

  describe 'communication' do

    before(:all) do
      credentials = read_credentials_file
      @session = Imgurapi::Session.new(credentials)
    end

    it 'should parse_message' do
      @session.send(:parse_message, '[]').should eq([])
      expect { session.send(:parse_message) }.to raise_error
    end

    it 'should process_message' do
      Response = Struct.new(:code, :body)

      response = Response.new(200, '[]')
      @session.send(:process_response, response).should eq([])

      response = Response.new(404, '[]')
      @session.send(:process_response, response).should eq([])

      response = Response.new(401, '{"error": {"message": "1"}}')
      expect { @session.send(:process_response, response) }.to raise_error "Unauthorized: 1"

      response = Response.new(500, '{"error": {"message": "1"}}')
      expect { @session.send(:process_response, response) }.to raise_error "Unauthorized: 1"

      code = rand(999)
      response = Response.new(code, '')
      expect { @session.send(:process_response, response) }.to raise_error "Response code #{code} not recognized"
    end

    it 'should compose_image' do
      @session.send(:compose_image, {}).should eq(nil)
      @session.send(:compose_image, {:imags => {:image => {}, :links => {}}}).should eq(nil)
      @session.send(:compose_image, {:images => {:imae => {}, :links => {}}}).should eq(nil)
      @session.send(:compose_image, {:images => {:image => {}, :lins => {}}}).should eq(nil)
      @session.send(:compose_image, {:images => {}}).should eq(nil)

      from_hash = {:images => {:image => {}, :links => {}}}
      @session.send(:compose_image, from_hash).should be_an_instance_of Imgurapi::Image
      @session.send(:compose_image, from_hash).links.should be_an_instance_of Imgurapi::Links
    end

  end

  describe 'image management calls' do

    before(:all) do
      credentials = read_credentials_file
      @session = Imgurapi::Session.new(credentials)
      @upload_path, @upload_file = my_sample_image
    end

    it 'should return my account information' do
      @session.account.should be_an_instance_of Hash
    end

    it 'should return the number of images stored' do
      @session.images_count.should > 0
    end

    it 'should upload the image' do
      expect { @session.upload('') }.to raise_error
      expect { @session.upload(:not_the_expected_object) }.to raise_error

      @@image_by_path = @session.upload(@upload_path) #FIXME I know this is horrible, but I need to share the same image between tests http://brentlavelle.wordpress.com/2011/04/04/rspec-and-instance-variables/
      @@image_by_path.should be_an_instance_of Imgurapi::Image

      @@image_by_file = @session.upload(@upload_file)
      @@image_by_file.should be_an_instance_of Imgurapi::Image
    end

    it 'should retrieve the image' do
      expect { @session.find(:not_an_image_hash) }.to raise_error
      expect { @session.find('r4ndom ha5h') }.to raise_error

      image = @session.find('valid_hash_not_related_to_any_image')
      image.should be_nil

      image = @session.find(@@image_by_path.hash)
      image.should be_an_instance_of Imgurapi::Image

      image.hash.should eq(@@image_by_path.hash)
    end

    it 'should delete the image' do
      expect { @session.destroy(:not_an_image_hash) }.to raise_error
      expect { @session.destroy('r4ndom ha5h') }.to raise_error

      @session.destroy('valid_hash_not_related_to_any_image').should be_false

      @session.destroy(@@image_by_path).should be_true #deletes first image

      @session.destroy(@@image_by_file.hash).should be_true #deletes second image
    end

  end

end

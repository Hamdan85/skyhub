class ImportPhoto
  require 'rest-client'

  attr_reader :json

  def initialize
    @json = JSON.parse(RestClient.get('http://54.152.221.29/images.json').body)
  end

  def import
    @json["images"].map{|photo| photo["url"]}.each do |url|
      picture = Photo.new
      picture.from_url(url)
      picture.save
    end
  end
end
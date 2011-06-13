class RestaurantAddress
  include MongoMapper::EmbeddedDocument

  key :street, String
  key :zip_code, String
  key :commune_id, ObjectId
  key :latitude, Float
  key :longitude, Float
end
class Restaurant
  include MongoMapper::Document

  key :name, String
  key :address, RestaurantAddress
  timestamps!
  
  def to_json
    hash = {id: _id, name: name}
    # io = StringIO.new
    # encoder = Yajl::Encoder.new
    # encoder.encode hash, io
    # io
    Yajl::Encoder.encode hash
  end
end
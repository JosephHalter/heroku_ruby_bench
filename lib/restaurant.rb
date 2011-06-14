class Restaurant
  include MongoMapper::Document
  key :name, String
  timestamps!
  def to_json
    Yajl::Encoder.encode(id: _id, name: name)
  end
end
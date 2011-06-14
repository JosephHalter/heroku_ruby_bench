require "sinatra"
require "yajl"
require "mongo_mapper"
require "restaurant"
configure do
  disable :logging
  uri = ENV["MONGOHQ_URL"] || "mongodb://localhost/test"
  config = {settings.environment => {"uri" => uri}}
  MongoMapper.setup config, settings.environment, {}
end
post "/restaurant" do
  body = Yajl::Parser.parse request.body
  restaurant = Restaurant.new body
  restaurant.save!
  [201, restaurant.to_json]
end
get "/restaurant/:id" do
  restaurant = Restaurant.find params[:id]
  restaurant ? restaurant.to_json : 404
end
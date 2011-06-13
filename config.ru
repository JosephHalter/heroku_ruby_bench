$:.unshift File.expand_path "../lib", __FILE__
require "app"
run Sinatra::Application
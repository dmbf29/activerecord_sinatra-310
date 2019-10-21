require_relative "config/application"
require "sinatra"
require "sinatra/reloader"
require "sinatra/activerecord"
require 'pry-byebug'

# / is our path
get '/' do # index
  @restaurants = Restaurant.order(name: :asc)
  erb :index
end

get '/restaurants/:id' do
  p params # is a hash provided to you
  # {"id"=>"12"}

  @restaurant = Restaurant.find(params['id'])
  erb :show
end

post '/restaurants' do
  # {"name"=>"Turtle Restaurant", "address"=>"Meguro"}
  @restaurant = Restaurant.new(params)
  @restaurant.save
  erb :show
end



# index -> Restaurant.all
# show -> Restaurant.find(1)
# new -> form
# edit -> form

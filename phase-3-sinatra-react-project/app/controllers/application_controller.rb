class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'

# Set up the routes

# Show all users
  get '/users' do
    content_type :json
    User.all.to_json
  end

# Show a specific user
  get '/users/:id' do
    content_type :json
    User.find(params[:id]).to_json
  end

# Create a new user
  post '/users' do
    content_type :json
    User.create(name: params[:name], email: params[:email]).to_json
  end

# Update a specific user
  put '/users/:id' do
    content_type :json
    user = User.find(params[:id])
    user.update(name: params[:name], email: params[:email])
    user.to_json
  end

# Delete a specific user
  delete '/users/:id' do
    content_type :json
    user = User.find(params[:id])
    user.destroy.to_json
  end
  
end

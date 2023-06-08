class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  require 'sinatra'
  require './config/environment'
  require 'json'
  
  enable :sessions
  
  users = []
  workouts = []
  exercises = []
  
  helpers do
    def current_user
      users.find { |u| u[:id] == session[:user_id] }
    end
  end
  
  post '/login' do
    user = users.find { |u| u[:email] == params[:email] && u[:pin] == params[:pin] }
    if user
      session[:user_id] = user[:id]
      user.to_json
    else
      status 401
    end
  end
  
  post '/signup' do
    user = { id: Time.now.to_i, name: params[:name], email: params[:email], pin: params[:pin] }
    users << user
    session[:user_id] = user[:id]
    user.to_json
  end
  
  get '/users/:id' do
    if current_user && current_user[:id] == params[:id].to_i
      current_user.to_json
    else
      status 401
    end
  end
  
  post '/workouts' do
    if current_user
      workout = { id: Time.now.to_i, name: params[:name], user_id: current_user[:id] }
      workouts << workout
      workout.to_json
    else
      status 401
    end
  end
  
  get '/workouts' do
    if current_user
      workouts.select { |w| w[:user_id] == current_user[:id] }.to_json
    else
      status 401
    end
  end
  
  put '/workouts/:id' do
    if current_user
      workout = workouts.find { |w| w[:id] == params[:id].to_i && w[:user_id] == current_user[:id] }
      if workout
        workout[:name] = params[:name]
        workout.to_json
      else
        status 404
      end
    else
      status 401
    end
  end
  
  delete '/workouts/:id' do
    if current_user
      workouts.reject! { |w| w[:id] == params[:id].to_i && w[:user_id] == current_user[:id] }
      status 204
    else
      status 401
    end
  end
  
  post '/exercises' do
    if current_user && workouts.any? { |w| w[:id] == params[:workout_id].to_i && w[:user_id] == current_user[:id] }
      exercise = { id: Time.now.to_i, name: params[:name], workout_id: params[:workout_id].to_i }
      exercises << exercise
      exercise.to_json
    else
      status 401
    end
  end
  
  get '/exercises' do
    if current_user && workouts.any? { |w| w[:id] == params[:workout_id].to_i && w[:user_id] == current_user[:id] }
      exercises.select { |e| e[:workout_id] == params[:workout_id].to_i }.to_json
  end

end
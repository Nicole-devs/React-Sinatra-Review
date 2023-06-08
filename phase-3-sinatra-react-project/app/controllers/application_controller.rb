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

# Show all workouts
  get '/workouts' do
    content_type :json
    Workout.all.to_json(include: [:user, :exercises])
  end

# Show a specific workout
  get '/workouts/:id' do
    content_type :json
    Workout.find(params[:id]).to_json(include: [:user, :exercises])
  end

# Create a new workout
  post '/workouts' do
    content_type :json
    workout = Workout.create(name: params[:name], description: params[:description], user_id: params[:user_id])
    params[:exercises].each do |exercise|
      workout.exercises.create(name: exercise[:name], sets: exercise[:sets], reps: exercise[:reps])
    end
    workout.to_json(include: [:user, :exercises])
  end

# Update a specific workout
  put '/workouts/:id' do
    content_type :json
    workout = Workout.find(params[:id])
    workout.update(name: params[:name], description: params[:description])
    workout.exercises.destroy_all
    params[:exercises].each do |exercise|
      workout.exercises.create(name: exercise[:name], sets: exercise[:sets], reps: exercise[:reps])
    end
    workout.to_json(include: [:user, :exercises])
  end

# Delete a specific workout
  delete '/workouts/:id' do
    content_type :json
    workout = Workout.find(params[:id])
    workout.destroy.to_json(include: [:user, :exercises])
  end

# Show all exercises
  get '/exercises' do
    content_type :json
    Exercise.all.to_json
  end

# Show a specific exercise
  get '/exercises/:id' do
    content_type :json
    Exercise.find(params[:id]).to_json
  end

# Create a new exercise
  post '/exercises' do
    content_type :json
    Exercise.create(name: params[:name], sets: params[:sets], reps: params[:reps], workout_id: params[:workout_id]).to_json
  end

# Update a specific exercise
  put '/exercises/:id' do
    content_type :json
    exercise = Exercise.find(params[:id])
    exercise.update(name: params[:name], sets: params[:sets], reps: params[:reps])
    exercise.to_json
  end

# Delete a specific exercise
  delete '/exercises/:id' do
    content_type :json
    exercise = Exercise.find(params[:id])
    exercise.destroy.to_json
  end

end

class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Add your routes here
  get '/' do
    'React frontend interface
          and 
  Sinatra backend API!'
  end
  
  # create a new workout for a user
  post '/users/:id/workouts' do
    user = User.find(params[:id])
    workout = user.workouts.create(params[:workout])
    workout.to_json
  end
  
  # read all workouts for a user
  get '/users/:id/workouts' do
    user = User.find(params[:id])
    workouts = user.workouts
    workouts.to_json
  end
  
  # update an individual workout
  put '/workouts/:id' do
    workout = Workout.find(params[:id])
    workout.update(params[:workout])
    workout.to_json
  end
  
  # delete a workout
  delete '/workouts/:id' do
    workout = Workout.find(params[:id])
    workout.destroy
  end
  
  # create a new exercise for a workout
  post '/workouts/:id/exercises' do
    workout = Workout.find(params[:id])
    exercise = workout.exercises.create(params[:exercise])
    exercise.to_json
  end
  
  # read all exercises for a workout
  get '/workouts/:id/exercises' do
    workout = Workout.find(params[:id])
    exercises = workout.exercises
    exercises.to_json
  end
  
  # update an individual exercise
  put '/exercises/:id' do
    exercise = Exercise.find(params[:id])
    exercise.update(params[:exercise])
    exercise.to_json
  end
  
  # delete an exercise
  delete '/exercises/:id' do
    exercise = Exercise.find(params[:id])
    exercise.destroy
  end
end  
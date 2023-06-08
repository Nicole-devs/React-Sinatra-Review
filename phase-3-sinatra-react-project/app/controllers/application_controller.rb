class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Add your routes here

  # Exercise routes
get '/exercises' do
  content_type :json
  authenticate!
  if params[:workout_id]
    @workout = Workout.find(params[:workout_id])
    halt 403 unless @workout.user == @current_user
    @exercises = @workout.exercises
  else
    @exercises = @current_user.workouts.map(&:exercises).flatten
  end
  @exercises.to_json
end

get '/exercises/:id' do
  content_type :json
  authenticate!
  @exercise = Exercise.find(params[:id])
  halt 403 unless @exercise.workout.user == @current_user
  {
    id: @exercise.id,
    name: @exercise.name,
    workout: {
      id: @exercise.workout.id,
      name: @exercise.workout.name
    }
  }.to_json
end

post '/exercises' do
  content_type :json
  authenticate!
  @workout = Workout.find(params[:workout_id])
  halt 403 unless @workout.user == @current_user
  @exercise = @workout.exercises.create(params)
  @exercise.to_json
end

put '/exercises/:id' do
  content_type :json
  authenticate!
  @exercise = Exercise.find(params[:id])
  halt 403 unless @exercise.workout.user == @current_user
  @exercise.update(params)
  @exercise.to_json
end

delete '/exercises/:id' do
  content_type :json
  authenticate!
  @exercise = Exercise.find(params[:id])
  halt 403 unless @exercise.workout.user == @current_user
  @exercise.destroy
  { success: "Exercise deleted" }.to_json
end

get '/search/exercises' do
  content_type :json
  authenticate!
  @exercises = @current_user.workouts.map(&:exercises).flatten.select do |exercise|
    exercise.name.downcase.include?(params[:query].downcase)
  end
  @exercises.to_json
end


# User routes
get '/users' do
  content_type :json
  if params[:name]
    @users = User.where(name: params[:name])
  else
    @users = User.all
  end
  @users.to_json
end

get '/users/:id' do
  content_type :json
  @user = User.find(params[:id])
  {
    id: @user.id,
    name: @user.name,
    email: @user.email,
    workouts: @user.workouts.map do |workout|
      {
        id: workout.id,
        name: workout.name,
        exercises: workout.exercises.map do |exercise|
          {
            id: exercise.id,
            name: exercise.name
          }
        end
      }
    end
  }.to_json
end

post '/users' do
  content_type :json
  @user = User.create(params)
  @user.to_json
end

put '/users/:id' do
  content_type :json
  @user = User.find(params[:id])
  @user.update(params)
  @user.to_json
end

delete '/users/:id' do
  content_type :json
  @user = User.find(params[:id])
  @user.destroy
  { success: "User deleted" }.to_json
end

get '/search/users' do
  content_type :json
  @users = User.where("email LIKE ?", "%#{params[:query]}%")
  @users.to_json
end



end

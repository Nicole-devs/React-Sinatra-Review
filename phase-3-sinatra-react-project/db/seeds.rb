puts "🌱 Seeding spices..."

# Seed your database here
# db/seeds.rb
User.create(name: 'Josh', email: 'alice@example.com')
User.create(name: 'Papa', email: 'bob@example.com')
User.create(name: 'Mercy', email: 'charlie@example.com')
User.create(name: 'Pesh', email: 'dave@example.com')

Workout.create(name: 'Monday Workout', user_id: 1)
Workout.create(name: 'Wednesday Workout', user_id: 1)
Workout.create(name: 'Friday Workout', user_id: 1)

Workout.create(name: 'Tuesday Workout', user_id: 2)
Workout.create(name: 'Thursday Workout', user_id: 2)
Workout.create(name: 'Saturday Workout', user_id: 2)

Workout.create(name: 'Sunday Workout', user_id: 3)
Workout.create(name: 'Tuesday Workout', user_id: 3)
Workout.create(name: 'Thursday Workout', user_id: 3)

Workout.create(name: 'Monday Workout', user_id: 4)
Workout.create(name: 'Wednesday Workout', user_id: 4)
Workout.create(name: 'Friday Workout', user_id: 4)

Exercise.create(name: 'Push-ups', workout_id: 1)
Exercise.create(name: 'Sit-ups', workout_id: 2)
Exercise.create(name: 'Squats', workout_id: 3)
Exercise.create(name: 'Lunges', workout_id: 4)
Exercise.create(name: 'Plank', workout_id: 5)

puts "✅ Done seeding!"

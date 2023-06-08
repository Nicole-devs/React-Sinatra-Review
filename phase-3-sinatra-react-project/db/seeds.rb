puts "🌱 Seeding fitness..."

# Seed your database here

User.create([
  { name: 'Alice', email: 'alice@example.com' },
  { name: 'Bob', email: 'bob@example.com' },
  { name: 'Charlie', email: 'charlie@example.com' }
])


Workout.create([
  { name: 'Monday Workout', user_id: 1 },
  { name: 'Wednesday Workout', user_id: 1 },
  { name: 'Friday Workout', user_id: 1 },
  { name: 'Tuesday Workout', user_id: 2 },
  { name: 'Thursday Workout', user_id: 2 },
  { name: 'Saturday Workout', user_id: 2 },
  { name: 'Sunday Workout', user_id: 3 },
  { name: 'Tuesday Workout', user_id: 3 },
  { name: 'Thursday Workout', user_id: 3 },
  { name: 'Monday Workout', user_id: 4 },
  { name: 'Wednesday Workout', user_id: 4 },
  { name: 'Friday Workout', user_id: 4 }
])


Exercise.create(name: 'Push-ups', workout_id: 1)
Exercise.create(name: 'Sit-ups', workout_id: 2)
Exercise.create(name: 'Squats', workout_id: 3)
Exercise.create(name: 'Lunges', workout_id: 4)
Exercise.create(name: 'Plank', workout_id: 5)

puts "✅ Done seeding!"

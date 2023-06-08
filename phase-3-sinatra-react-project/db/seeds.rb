puts "🌱 Seeding fitness..."

# Seed your database here

User.create([
  { name: 'Papa', email: 'alice@example.com' },
  { name: 'Davy', email: 'bob@example.com' },
  { name: 'Mercy', email: 'charlie@example.com' }
  { name: 'Pesh', email: 'charlie@example.com' }
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


Exercise.create([
{name: 'Push-ups', workout_id: 1}
{name: 'Sit-ups', workout_id: 2} 
{name: 'Squats', workout_id: 3}
{name: 'Lunges', workout_id: 4}
{name: 'Plank', workout_id: 5}
])

puts "✅ Done seeding!"

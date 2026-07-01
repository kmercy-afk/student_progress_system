puts "Deleting old data..."

Progress.destroy_all
Assignment.destroy_all
Course.destroy_all
Student.destroy_all
User.destroy_all

puts "Creating users..."

admin = User.create!(
  name: "Admin",
  email: "admin@example.com",
  password: "password",
  password_confirmation: "password",
  admin: true
)

user = User.create!(
  name: "Mercy",
  email: "mercy@example.com",
  password: "password",
  password_confirmation: "password",
  admin: false
)

3.times do |i|
  User.create!(
    name: "User #{i + 1}",
    email: "user#{i + 1}@example.com",
    password: "password",
    password_confirmation: "password",
    admin: false
  )
end

puts "Creating students..."

students = []

5.times do |i|
  students << Student.create!(
    name: "Student #{i + 1}",
    email: "student#{i + 1}@example.com",
    phone_number: "07123456#{i}",
    user: user
  )
end

puts "Creating courses..."

courses = []

5.times do |i|
  courses << Course.create!(
    title: "Course #{i + 1}",
    description: "Description for Course #{i + 1}",
    user: user
  )
end

puts "Creating assignments..."

assignments = []

5.times do |i|
  assignments << Assignment.create!(
    title: "Assignment #{i + 1}",
    description: "Complete Assignment #{i + 1}",
    due_date: Date.today + (i + 1).days,
    course: courses[i]
  )
end

puts "Creating progress records..."

5.times do |i|
  Progress.create!(
    student: students[i],
    course: courses[i],
    completion_percentage: (i + 1) * 20,
  )
end

puts "================================="
puts "Seed completed successfully!"
puts "================================="
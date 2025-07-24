# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# Create Schools
puts "Creating schools..."
5.times do |i|
  school_name = "School #{i + 1}"
  School.create!(name: school_name)
  puts "Created school: #{school_name}"
end

# Create Students
puts "Creating students..."
School.find_each do |school|
  2.times do |i|
    Student.create!(
      name: "Student#{i + 1} - #{school.name}",
      email: "student#{i + 1}_#{school.id}@example.com",
      password: "Password123",
      school: school
    )
    puts "Created student: student#{i + 1}_#{school.id}@example.com"
  end
end
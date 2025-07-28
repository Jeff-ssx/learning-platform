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

# Create Terms
puts "Creating terms..."
School.find_each do |school|
  5.times do |i|
    Term.create!(
      name: "#{school.name} - Term#{i + 1}",
      school: school
    )
    puts "Created term: #{school.name} - Term#{i + 1}"
  end
end

# Create Courses
puts "Creating courses..."
Term.find_each do |term|
  5.times do |i|
    Course.create!(
      name: "#{term.name} - Course#{i + 1}",
      term: term
    )
    puts "Created Course: #{term.name} - Course#{i + 1}"
  end
end

# Create Licenses
puts "Creating Licenses..."
Term.find_each do |term|
  5.times do |i|
    License.create!(
      code: "#{term.name} - Licenses#{i + 1}",
      term: term
    )
    puts "Created Licenses: #{term.name} - Licenses#{i + 1}"
  end
end
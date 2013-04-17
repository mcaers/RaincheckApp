# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.destroy_all
Raincheck.destroy_all

user = User.create!(first_name: "Bob", last_name: "Barker", email: "bob@hotmail.com", password: "bobby123")

5.times do |i|
    raincheck1 = user.rainchecks.create!(title: "Raincheck #{i}", description: "description #{i}", completed: false)
end

puts "hello"
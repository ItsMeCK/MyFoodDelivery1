# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


10.times do |i|
	FoodItem.create(name: "Food#{i}", price: 10*i)
end

10.times do |i|
	Locality.create(locality_name: "Locality#{i}")
end

10.times do |i|
	start_time = "0#{i}:00".to_time
	end_time = "0#{i+1}:00".to_time
	TimeSlot.create(start_time: start_time, end_time: end_time)
end
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
include Faker
54.times do 
	Event.create(
			title: Faker::Name.unique.name, 
			location: Faker::Address.full_address, 
			start_time: Faker::Date.in_date_period, 
			description:Faker::Lorem.sentence(word_count: 43),
			creator_id:1
		)
end

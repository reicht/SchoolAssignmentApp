# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


rand(26..50).times do
  place = School.create(name: Faker::University.name)
  rand(20..40).times do
    person = Teacher.create(name: Faker::Name.prefix + " " + Faker::Name.name, school_id: place.id)
    rand(18..44).times do
      Student.create(name: Faker::Name.name, teacher_id: person.id, school_id: place.id )
    end
  end
end

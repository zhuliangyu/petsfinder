# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
10.times do
  User.create ({first_name: Faker::Name.first_name,
                last_name: Faker::Name.last_name,
                email: SecureRandom.uuid.to_s+'@abc.com',
                password: "123456",
                city:Faker::Name.first_name

  })
end
puts "Generate users successfully"


Message.destroy_all
10.times do
  Message.create ({title: Faker::Lorem.sentence,
                   body: Faker::Lorem.paragraphs,
                   user: User.all.sample

  })
end
puts "Generate Message successfully"


Sighting.destroy_all
10.times do
  Sighting.create ({pet_type: Faker::Pokemon.name,
                    date_seen: Faker::Date.between_except(1.year.ago, 1.year.from_now, Date.today),
                    note: Faker::Lorem.paragraph,
                    images: Faker::Lorem.sentence,
                    contact: Faker::PhoneNumber.phone_number,
                    user: User.all.sample


  })
end
puts "Generate sightings successfully"


Pet.destroy_all
10.times do
  Pet.create ({pet_type: Faker::Name.name,
               breed: Faker::Name.name,
               name: Faker::Pokemon.name,
               sex: ['M', 'F'].sample,
               color: Faker::Color.color_name,
               age: Faker::Number.between(1, 10),
               date_seen: Faker::Date.between_except(1.year.ago, 1.year.from_now, Date.today),
               note: Faker::Lorem.paragraph,
               images: Faker::Lorem.sentence,
               lost: Faker::Boolean.boolean,
               user: User.all.sample
  })
end
puts "Generate pets successfully"

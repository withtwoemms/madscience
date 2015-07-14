require 'faker'

faculty = Position.create!( title: "faculty" )
staff = Position.create!( title: "staff" )

alice = User.create!( first_name: "Alice",
                  last_name: "Adams",
                  email: Faker::Internet.email,
                  password: "pass",
                  position: faculty)

bob = User.create!

10.times do
  Project.create!(name: Faker::Lorem.sentence,
                  summary: Faker::Lorem.sentence,
                  hypothesis: Faker::Lorem.sentence,
                  creator: Faker::Name.name)
end

40.times do
  Experiment.create!()

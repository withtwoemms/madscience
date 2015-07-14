require 'faker'

faculty = Position.create!(                           title: "faculty" )
staff = Position.create!(                             title: "staff" )

alice = User.create!(                                 first_name: "Alice",
                                                      last_name: "Adams",
                                                      email: Faker::Internet.email,
                                                      password: "pass",
                                                      position: faculty)

bob = User.create!(                                   first_name: "Bob",
                                                      last_name: "Byers",
                                                      email: Faker::Internet.email,
                                                      password: "pass",
                                                      position: staff)

10.times do
  Project.create!(                                    name: Faker::Lorem.sentence,
                                                      summary: Faker::Lorem.sentence,
                                                      hypothesis: Faker::Lorem.sentence,
                                                      creator: alice)
  Project.comments = Comment.create!(                 content: Faker::Lorem.paragraph,
                                                      commenter: bob)
end

40.times do
  Experiment.create!(                                 name: Faker::Lorem.sentence,
                                                      results: Faker::Lorem.sentence,
                                                      conclusion: Faker::Lorem.sentence,
                                                      project: Project.find_by(id: rand(1..10)),
                                                      experimenter: bob)

  Experiment.procedures = Procedure.create!(          instructions: Faker::Lorem.paragraph)
  Experiment.procedures.comments = Comment.create!(   content: Faker::Lorem.paragraph,
                                                      commenter: bob)

  Experiment.observations = Observation.create!(      content: Faker::Lorem.paragraph)
  Experiment.observations.comments = Comment.create!( content: Faker::Lorem.paragraph,
                                                      commenter: bob)
end



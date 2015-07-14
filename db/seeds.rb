require 'faker'

faculty = Position.create!(                           title: "faculty" )
staff = Position.create!(                             title: "staff" )

alice = User.create!(                                 first_name: "Alice",
                                                      last_name: "Adams",
                                                      email: "alice@alyu.edu",
                                                      password: "pass",
                                                      position: faculty)

bob = User.create!(                                   first_name: "Bob",
                                                      last_name: "Byers",
                                                      email: "bob@alyu.edu",
                                                      password: "pass",
                                                      position: staff)

project1 = Project.create!(                          name: Faker::Lorem.sentence,
                                                    summary: Faker::Lorem.sentence,
                                                    hypothesis: Faker::Lorem.sentence,
                                                    creator: alice)

project2 = Project.create!(                          name: Faker::Lorem.sentence,
                                                    summary: Faker::Lorem.sentence,
                                                    hypothesis: Faker::Lorem.sentence,
                                                    creator: alice)

project3 = Project.create!(                          name: Faker::Lorem.sentence,
                                                    summary: Faker::Lorem.sentence,
                                                    hypothesis: Faker::Lorem.sentence,
                                                    creator: alice)

projects_array = [project1, project2, project3]

projects_array.each do |project|
  rand(1..3).times do
    project.comments.create!(                           content: Faker::Lorem.paragraph,
                                                        commenter: bob)
  end

  rand(1..5).times do
    project.experiments.create!(                       name: Faker::Lorem.sentence,
                                                      results: Faker::Lorem.sentence,
                                                      conclusion: Faker::Lorem.sentence,
                                                      experimenter: bob)
  end

  experiments_array = project.experiments.all

  experiments_array.each do |experiment|
    procedure = experiment.procedures.create!(          instructions: Faker::Lorem.paragraph)

    rand(1..3).times do
      procedure.observations.create!(                          content: Faker::Lorem.paragraph)
    end

    rand(1..5).times do
      experiment.observations.create!(                     content: Faker::Lorem.paragraph)
    end

    observations_array = experiment.observations.all + procedure.observations.all

    observations_array.each do |observation|
      rand(1..3).times do
        observation.comments.create!(                   content: Faker::Lorem.paragraph,
                                                        commenter: bob)
      end
    end
  end
end

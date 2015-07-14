FactoryGirl.define do
  factory :user do
    first_name "Testy"
    last_name "McTester"
    email {Faker::Internet.email}
    password "password"

    factory :faculty_user, class: User do
      association :position, factory: :faculty
    end

    factory :staff_user, class: User do
      association :position, factory: :staff
    end
  end
end

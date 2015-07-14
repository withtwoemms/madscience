FactoryGirl.define do
  factory :user do
    first_name "Testy"
    last_name "McTester"
    email "test@gmail.com"
    password "password"
  end

  factory :faculty_user, class: User do
    association :position, factory: :faculty
  end

  factory :staff_user, class: User do
    association :position, factory: :staff
  end
end

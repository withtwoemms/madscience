FactoryGirl.define do
  factory :user do
    first_name "Testy"
    last_name "McTester"
    email "test@gmail.com"
    password "password"
  end

  factory :faculty_user do
    association :user, :faculty
  end
end

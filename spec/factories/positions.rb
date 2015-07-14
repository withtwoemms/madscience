FactoryGirl.define do
  factory :position do
    trait :faculty do
      title "faculty"
    end

    trait :staff do
      title "staff"
    end
  end
end

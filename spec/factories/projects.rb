FactoryGirl.define do
  factory :project do
    name "Create tests"
    summary "Get tests to work with FactoryGirl and rspec"
    hypothesis "This will eventually work"

    factory :faculty_project, class: Project do
      association :creator, factory: :faculty_user
    end

    factory :staff_project, class: Project do
      association :creator, factory: :staff_user
    end
end
end

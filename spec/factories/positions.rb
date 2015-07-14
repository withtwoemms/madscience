FactoryGirl.define do
  factory :faculty, class: Position do
    title "faculty"
  end

  factory :staff, class: Position do
    title "staff"
  end
end

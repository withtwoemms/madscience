FactoryGirl.define do
  factory :observation do
    content "I observe this working"

    factory :observed_experiment, class: Observation do
      association :observable, factory: :full_experiment
    end

    factory :observed_procedure, class: Observation do
      association :observable, factory: :full_procedure
    end
  end
end

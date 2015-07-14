FactoryGirl.define do
  factory :procedure do
    instructions "Make this work"

    factory :full_procedure, class: Procedure do
      association :experiment, factory: :full_experiment
    end
  end
end

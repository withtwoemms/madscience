FactoryGirl.define do
  factory :experiment do
    name "Experiment"
    results "Something happened"
    conclusion "Something finally worked"

    factory :experiment_project, class: Experiment do
      association :project, factory: :faculty_project

      factory :full_experiment, class: Experiment do
        association :experimenter, factory: :staff_user
      end
    end
  end
end

FactoryGirl.define do
  factory :comment do
    content "-- Nothing to see here --"

    factory :authored_comment, class: Comment do
      association :commenter, factory: :faculty_user

      factory :project_comment, class: Comment do
        association :commentable, factory: :faculty_project
      end

      factory :experiment_comment, class: Comment do
        association :commentable, factory: :full_experiment
      end

      factory :observed_experiment_comment, class: Comment do
        association :commentable, factory: :observed_experiment
      end

      factory :observed_procedure_comment, class: Comment do
        association :commentable, factory: :observed_procedure
      end
    end
  end
end

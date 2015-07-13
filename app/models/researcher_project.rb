class ResearcherProject < ActiveRecord::Base
  belongs_to :researcher, class_name: "User"
  belongs_to :project
end

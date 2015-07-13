class User < ActiveRecord::Base
  belongs_to :position
  has_many :researcher_projects, foreign_key: :researcher_id
  has_many :created_proposals, class_name: "Proposals", foreign_key: :creator_id
  has_many :comments, foreign_key: :commenter_id
  has_many :experiments, foreign_key: :experimenter_id
  has_many :projects, through: :researcher_projects
  has_many :observations, through: :experiments
  has_many :procedures, through: :experiments
end

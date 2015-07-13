class Proposal < ActiveRecord::Base
  belongs_to :creator, class_name: "User"
  has_many :researcher_projects, foreign_key: :projects
  has_many :experiments
  has_many :comments, :as => :commentable
  has_many :researchers, through: :researcher_projects
end

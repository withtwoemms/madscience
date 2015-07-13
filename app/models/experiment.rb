class Experiment < ActiveRecord::Base
  belongs_to :proposal
  belongs_to :experimenter, class_name: "User"
  has_many :procedures
  has_many :observations, :as => :observable
  has_many :comments, :as => :commentable
end

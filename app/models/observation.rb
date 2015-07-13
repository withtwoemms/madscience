class Observation < ActiveRecord::Base
  belongs_to  :observable, :polymorphic => true
  has_many    :comments, :as => :commentable
end

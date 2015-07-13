class Procedure < ActiveRecord::Base
  belongs_to  :experiment
  has_many    :observations, :as => :observable
end

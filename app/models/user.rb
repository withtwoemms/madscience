class User < ActiveRecord::Base
  belongs_to :position
  has_many :researcher_projects, foreign_key: :researcher_id
  has_many :created_proposals, class_name: "Project", foreign_key: :creator_id
  has_many :comments, foreign_key: :commenter_id
  has_many :experiments, foreign_key: :experimenter_id
  has_many :projects, through: :researcher_projects
  has_many :observations, through: :experiments
  has_many :procedures, through: :experiments

  has_secure_password

  validates :email, presence: true,
  									uniqueness: true,
  									length: { maximum: 255 },
  									format: { with: /\A[a-zA-Z0-9_.+\-]+@[a-zA-Z0-9\-]+\.[a-zA-Z0-9\-.]+\z/ }


  def full_name
  	"#{self.first_name} #{self.last_name}"
  end
end

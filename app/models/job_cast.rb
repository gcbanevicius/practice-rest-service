class JobCast < ActiveRecord::Base

  belongs_to :organization
  has_and_belongs_to_many :individuals

  validates_presence_of :title
  validates_presence_of :description
  validates_presence_of :city
  validates_presence_of :state

end

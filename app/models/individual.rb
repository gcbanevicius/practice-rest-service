class Individual < ActiveRecord::Base

  has_and_belongs_to_many :job_casts

  EMAIL_REGEX = /\A[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}\Z/i

  validates_presence_of :first_name
  validates_presence_of :last_name
  validates_presence_of :email
  validates_format_of :email, :with => EMAIL_REGEX
  validates_presence_of :password

end

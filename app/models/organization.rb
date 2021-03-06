class Organization < ActiveRecord::Base

  has_many :job_casts

  URL_REGEX = /.+\.(COM|EDU)/i

  validates_presence_of :name
  validates_presence_of :url
  validates_format_of :url, :with => URL_REGEX


end

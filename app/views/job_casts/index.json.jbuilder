json.array!(@job_casts) do |job_cast|
  json.extract! job_cast, :id, :title, :description, :compensation_min, :compensation_max, :skills, :city, :state, :postal_code, :country_code
  json.url job_cast_url(job_cast, format: :json)
end

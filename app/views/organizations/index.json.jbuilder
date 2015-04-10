json.array!(@organizations) do |organization|
  json.extract! organization, :id, :name, :url
  json.url organization_url(organization, format: :json)
end

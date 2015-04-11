require 'rails_helper'

RSpec.describe "Organizations", type: :request do

  before(:each) do
    @organization_params = {
      "name" => "Software Corporation",
      "url" => "softwarecorp.com"
    }

     @request_headers = {
      "Accept" => "application/json",
      "Content-Type" => "application/json"
    }

  end

  describe "GET /organizations" do
    it "works! (now write some real specs)" do
      get organizations_path
      expect(response).to have_http_status(200)
    end
  end

  describe "POST /organizations" do
    it "should create a new Organization" do

      post "/organizations", @organization_params.to_json, @request_headers

      expect(response.status).to eq 201 # created
      expect(JSON.parse(response.body)["name"]).to eq @organization_params["name"]

    end
  end

  describe "GET /organizations/:id" do
    it "should get the Organization with specified ID" do
      
      org = Organization.create(@organization_params)      
      get "/organizations/#{org.id}", @request_headers

      expect(JSON.parse(response.body)["name"]).to eq @organization_params["name"]

    end
  end

  describe "PATCH/PUT /organizations/:id" do
    it "should update the Organization with specified ID" do
      
      new_organization_params = @organization_params
      new_organization_params["url"] = "newsoftwarecorp.edu"
     
      ind = Organization.create(@organization_params)      
      patch "/organizations/#{ind.id}", :id => ind.id, :organization => new_organization_params
      
      expect(JSON.parse(response.body)["url"]).to eq @organization_params["url"]

    end
  end

  describe "DELETE /organizations/:id" do
    it "should delete the Organization with specified ID" do
      
      org = Organization.create(@organization_params)      
      delete "/organizations/#{org.id}"      

      expect(response).to have_http_status(204)

    end
  end

end

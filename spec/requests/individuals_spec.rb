require 'rails_helper'

RSpec.describe "Individuals", type: :request do

  before(:each) do
    @individual_params = {
      "first_name" => "Jon",
      "last_name" => "Do",
      "email" => "jondo@jon.com",
      "password" => "notaverygoodpassword"
    }

     @request_headers = {
      "Accept" => "application/json",
      "Content-Type" => "application/json"
    }

  end

  describe "GET /individuals" do
    it "works! (now write some real specs)" do
      get individuals_path
      expect(response).to have_http_status(200)
    end
  end

  describe "POST /individuals" do
    it "should create a new Individual" do

      post "/individuals", @individual_params.to_json, @request_headers

      expect(response.status).to eq 201 # created
      expect(JSON.parse(response.body)["last_name"]).to eq @individual_params["last_name"]

    end
  end

  describe "GET /individuals/:id" do
    it "should get the Individual with specified ID" do
      
      jc = Individual.create(@individual_params)      
      get "/individuals/#{jc.id}", @request_headers

      expect(JSON.parse(response.body)["last_name"]).to eq @individual_params["last_name"]

    end
  end

  describe "PATCH/PUT /individuals/:id" do
    it "should update the Individual with specified ID" do
      
      new_individual_params = @individual_params
      new_individual_params["first_name"] = "James"
     
      ind = Individual.create(@individual_params)      
      patch "/individuals/#{ind.id}", :id => ind.id, :individual => new_individual_params
      
      expect(JSON.parse(response.body)["first_name"]).to eq @individual_params["first_name"]

    end
  end

  describe "DELETE /individuals/:id" do
    it "should delete the Individual with specified ID" do
      
      jc = Individual.create(@individual_params)      
      delete "/individuals/#{jc.id}"      

      expect(response).to have_http_status(204)

    end
  end

end

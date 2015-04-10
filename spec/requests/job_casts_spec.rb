require 'rails_helper'

RSpec.describe "JobCasts", type: :request do

  before(:each) do
    @job_cast_params = {
      "organization_id" => 123,
      "title" => "Lead Dev",
      "description" => "Head developer for team",
      "compensation_min" => 50000, 
      "compensation_max" => 100000, 
      "skills" => "Ruby",
      "city" => "NY",
      "state" => "NY",
      "postal_code" => "10000",
      "country_code" => "1"
    }

     @request_headers = {
      "Accept" => "application/json",
      "Content-Type" => "application/json"
    }

  end

  describe "GET /job_casts" do
    it "works! (now write some real specs)" do
      get job_casts_path
      expect(response).to have_http_status(200)
    end
  end

  describe "POST /job_casts" do
    it "should create a new JobCast" do

      post "/job_casts", @job_cast_params.to_json, @request_headers

      expect(response.status).to eq 201 # created
      expect(JSON.parse(response.body)["organization_id"]).to eq @job_cast_params["organization_id"]

    end
  end

  describe "GET /job_casts/:id" do
    it "should get the JobCast with specified ID" do
      
      jc = JobCast.create(@job_cast_params)      
      get "/job_casts/#{jc.id}", @request_headers

      expect(JSON.parse(response.body)["organization_id"]).to eq @job_cast_params["organization_id"]

    end
  end

  describe "PATCH/PUT /job_casts/:id" do
    it "should update the JobCast with specified ID" do
      
      new_job_cast_params = @job_cast_params
      new_job_cast_params["title"] = "Test developer"
      new_job_cast_params["description"] = "Develop test suite for software"

     
      jc = JobCast.create(@job_cast_params)      
      patch "/job_casts/#{jc.id}", :id => jc.id, :job_cast => new_job_cast_params
      
      expect(JSON.parse(response.body)["title"]).to eq @job_cast_params["title"]
      expect(JSON.parse(response.body)["description"]).to eq @job_cast_params["description"]

    end
  end

  describe "DELETE /job_casts/:id" do
    it "should delete the JobCast with specified ID" do
      
      jc = JobCast.create(@job_cast_params)      
      delete "/job_casts/#{jc.id}"      

      expect(response).to have_http_status(204)

    end
  end




end

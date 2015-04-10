require "rails_helper"

RSpec.describe JobCastsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/job_casts").to route_to("job_casts#index")
    end

    it "routes to #new" do
      expect(:get => "/job_casts/new").to route_to("job_casts#new")
    end

    it "routes to #show" do
      expect(:get => "/job_casts/1").to route_to("job_casts#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/job_casts/1/edit").to route_to("job_casts#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/job_casts").to route_to("job_casts#create")
    end

    it "routes to #update" do
      expect(:put => "/job_casts/1").to route_to("job_casts#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/job_casts/1").to route_to("job_casts#destroy", :id => "1")
    end

  end
end

require 'rails_helper'

RSpec.describe "JobCasts", type: :request do
  describe "GET /job_casts" do
    it "works! (now write some real specs)" do
      get job_casts_path
      expect(response).to have_http_status(200)
    end
  end
end

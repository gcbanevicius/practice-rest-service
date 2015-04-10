require 'rails_helper'

RSpec.describe "job_casts/show", type: :view do
  before(:each) do
    @job_cast = assign(:job_cast, JobCast.create!(
      :title => "Title",
      :description => "MyText",
      :compensation_min => "",
      :compensation_max => "",
      :skills => "MyText",
      :city => "City",
      :state => "State",
      :postal_code => "Postal Code",
      :country_code => "Country Code"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/City/)
    expect(rendered).to match(/State/)
    expect(rendered).to match(/Postal Code/)
    expect(rendered).to match(/Country Code/)
  end
end

require 'rails_helper'

RSpec.describe "job_casts/index", type: :view do
  before(:each) do
    assign(:job_casts, [
      JobCast.create!(
        :title => "Title",
        :description => "MyText",
        :compensation_min => "",
        :compensation_max => "",
        :skills => "MyText",
        :city => "City",
        :state => "State",
        :postal_code => "Postal Code",
        :country_code => "Country Code"
      ),
      JobCast.create!(
        :title => "Title",
        :description => "MyText",
        :compensation_min => "",
        :compensation_max => "",
        :skills => "MyText",
        :city => "City",
        :state => "State",
        :postal_code => "Postal Code",
        :country_code => "Country Code"
      )
    ])
  end

  it "renders a list of job_casts" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "City".to_s, :count => 2
    assert_select "tr>td", :text => "State".to_s, :count => 2
    assert_select "tr>td", :text => "Postal Code".to_s, :count => 2
    assert_select "tr>td", :text => "Country Code".to_s, :count => 2
  end
end

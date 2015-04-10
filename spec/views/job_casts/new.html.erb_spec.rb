require 'rails_helper'

RSpec.describe "job_casts/new", type: :view do
  before(:each) do
    assign(:job_cast, JobCast.new(
      :title => "MyString",
      :description => "MyText",
      :compensation_min => "",
      :compensation_max => "",
      :skills => "MyText",
      :city => "MyString",
      :state => "MyString",
      :postal_code => "MyString",
      :country_code => "MyString"
    ))
  end

  it "renders new job_cast form" do
    render

    assert_select "form[action=?][method=?]", job_casts_path, "post" do

      assert_select "input#job_cast_title[name=?]", "job_cast[title]"

      assert_select "textarea#job_cast_description[name=?]", "job_cast[description]"

      assert_select "input#job_cast_compensation_min[name=?]", "job_cast[compensation_min]"

      assert_select "input#job_cast_compensation_max[name=?]", "job_cast[compensation_max]"

      assert_select "textarea#job_cast_skills[name=?]", "job_cast[skills]"

      assert_select "input#job_cast_city[name=?]", "job_cast[city]"

      assert_select "input#job_cast_state[name=?]", "job_cast[state]"

      assert_select "input#job_cast_postal_code[name=?]", "job_cast[postal_code]"

      assert_select "input#job_cast_country_code[name=?]", "job_cast[country_code]"
    end
  end
end

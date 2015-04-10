require 'rails_helper'

RSpec.describe "individuals/new", type: :view do
  before(:each) do
    assign(:individual, Individual.new(
      :first_name => "MyString",
      :last_name => "MyString",
      :email => "MyString",
      :password => "MyString"
    ))
  end

  it "renders new individual form" do
    render

    assert_select "form[action=?][method=?]", individuals_path, "post" do

      assert_select "input#individual_first_name[name=?]", "individual[first_name]"

      assert_select "input#individual_last_name[name=?]", "individual[last_name]"

      assert_select "input#individual_email[name=?]", "individual[email]"

      assert_select "input#individual_password[name=?]", "individual[password]"
    end
  end
end

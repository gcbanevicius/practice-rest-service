require 'rails_helper'

RSpec.describe "individuals/edit", type: :view do
  before(:each) do
    @individual = assign(:individual, Individual.create!(
      :first_name => "MyString",
      :last_name => "MyString",
      :email => "MyString@mystring.com",
      :password => "MyString"
    ))
  end

  it "renders the edit individual form" do
    render

    assert_select "form[action=?][method=?]", individual_path(@individual), "post" do

      assert_select "input#individual_first_name[name=?]", "individual[first_name]"

      assert_select "input#individual_last_name[name=?]", "individual[last_name]"

      assert_select "input#individual_email[name=?]", "individual[email]"

      assert_select "input#individual_password[name=?]", "individual[password]"
    end
  end
end

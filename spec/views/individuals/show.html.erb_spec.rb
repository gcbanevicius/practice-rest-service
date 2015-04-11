require 'rails_helper'

RSpec.describe "individuals/show", type: :view do
  before(:each) do
    @individual = assign(:individual, Individual.create!(
      :first_name => "First Name",
      :last_name => "Last Name",
      :email => "Email@gmail.com",
      :password => "Password"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/First Name/)
    expect(rendered).to match(/Last Name/)
    expect(rendered).to match(/Email/)
    expect(rendered).to match(/Password/)
  end
end

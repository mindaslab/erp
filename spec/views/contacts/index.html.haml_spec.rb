require 'spec_helper'

describe "contacts/index" do
  before(:each) do
    assign(:contacts, [
      stub_model(Contact,
        :company => nil,
        :name => "Name",
        :ph => "Ph",
        :email => "Email",
        :address => "Address",
        :city => "City",
        :zip => "Zip",
        :country => "Country",
        :business => false,
        :customer => false,
        :supplier => false,
        :employee => false
      ),
      stub_model(Contact,
        :company => nil,
        :name => "Name",
        :ph => "Ph",
        :email => "Email",
        :address => "Address",
        :city => "City",
        :zip => "Zip",
        :country => "Country",
        :business => false,
        :customer => false,
        :supplier => false,
        :employee => false
      )
    ])
  end

  it "renders a list of contacts" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Ph".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => "Address".to_s, :count => 2
    assert_select "tr>td", :text => "City".to_s, :count => 2
    assert_select "tr>td", :text => "Zip".to_s, :count => 2
    assert_select "tr>td", :text => "Country".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end

require 'spec_helper'

describe "records/index" do
  before(:each) do
    assign(:records, [
      stub_model(Record,
        :amount => "9.99",
        :description => "MyText",
        :book => nil,
        :status => 1
      ),
      stub_model(Record,
        :amount => "9.99",
        :description => "MyText",
        :book => nil,
        :status => 1
      )
    ])
  end

  it "renders a list of records" do
    render
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end

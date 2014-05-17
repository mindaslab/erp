require 'spec_helper'

describe "records/show" do
  before(:each) do
    @record = assign(:record, stub_model(Record,
      :amount => "9.99",
      :description => "MyText",
      :book => nil,
      :status => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(//)
    expect(rendered).to match(/1/)
  end
end

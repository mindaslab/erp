require 'spec_helper'

describe "docs/show" do
  before(:each) do
    @doc = assign(:doc, stub_model(Doc,
      :record => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
  end
end

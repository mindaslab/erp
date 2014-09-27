require 'spec_helper'

describe "docs/index" do
  before(:each) do
    assign(:docs, [
      stub_model(Doc,
        :record => nil
      ),
      stub_model(Doc,
        :record => nil
      )
    ])
  end

  it "renders a list of docs" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end

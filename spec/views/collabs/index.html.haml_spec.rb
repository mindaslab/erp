require 'spec_helper'

describe "collabs/index" do
  before(:each) do
    assign(:collabs, [
      stub_model(Collab,
        :email => "Email",
        :company => nil
      ),
      stub_model(Collab,
        :email => "Email",
        :company => nil
      )
    ])
  end

  it "renders a list of collabs" do
    render
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end

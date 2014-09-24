require 'spec_helper'

describe "collabs/show" do
  before(:each) do
    @collab = assign(:collab, stub_model(Collab,
      :email => "Email",
      :company => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Email/)
    expect(rendered).to match(//)
  end
end

require 'spec_helper'

describe "collabs/edit" do
  before(:each) do
    @collab = assign(:collab, stub_model(Collab,
      :email => "MyString",
      :company => nil
    ))
  end

  it "renders the edit collab form" do
    render

    assert_select "form[action=?][method=?]", collab_path(@collab), "post" do
      assert_select "input#collab_email[name=?]", "collab[email]"
      assert_select "input#collab_company[name=?]", "collab[company]"
    end
  end
end

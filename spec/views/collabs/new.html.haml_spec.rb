require 'spec_helper'

describe "collabs/new" do
  before(:each) do
    assign(:collab, stub_model(Collab,
      :email => "MyString",
      :company => nil
    ).as_new_record)
  end

  it "renders new collab form" do
    render

    assert_select "form[action=?][method=?]", collabs_path, "post" do
      assert_select "input#collab_email[name=?]", "collab[email]"
      assert_select "input#collab_company[name=?]", "collab[company]"
    end
  end
end

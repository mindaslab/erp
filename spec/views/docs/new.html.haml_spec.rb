require 'spec_helper'

describe "docs/new" do
  before(:each) do
    assign(:doc, stub_model(Doc,
      :record => nil
    ).as_new_record)
  end

  it "renders new doc form" do
    render

    assert_select "form[action=?][method=?]", docs_path, "post" do
      assert_select "input#doc_record[name=?]", "doc[record]"
    end
  end
end

require 'spec_helper'

describe "docs/edit" do
  before(:each) do
    @doc = assign(:doc, stub_model(Doc,
      :record => nil
    ))
  end

  it "renders the edit doc form" do
    render

    assert_select "form[action=?][method=?]", doc_path(@doc), "post" do
      assert_select "input#doc_record[name=?]", "doc[record]"
    end
  end
end

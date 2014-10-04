require 'spec_helper'

describe "notes/edit" do
  before(:each) do
    @note = assign(:note, stub_model(Note,
      :content => "MyText",
      :record => nil
    ))
  end

  it "renders the edit note form" do
    render

    assert_select "form[action=?][method=?]", note_path(@note), "post" do
      assert_select "textarea#note_content[name=?]", "note[content]"
      assert_select "input#note_record[name=?]", "note[record]"
    end
  end
end

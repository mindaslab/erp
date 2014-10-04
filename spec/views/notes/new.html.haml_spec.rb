require 'spec_helper'

describe "notes/new" do
  before(:each) do
    assign(:note, stub_model(Note,
      :content => "MyText",
      :record => nil
    ).as_new_record)
  end

  it "renders new note form" do
    render

    assert_select "form[action=?][method=?]", notes_path, "post" do
      assert_select "textarea#note_content[name=?]", "note[content]"
      assert_select "input#note_record[name=?]", "note[record]"
    end
  end
end

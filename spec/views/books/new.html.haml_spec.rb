require 'spec_helper'

describe "books/new" do
  before(:each) do
    assign(:book, stub_model(Book,
      :name => "MyString",
      :description => "MyText",
      :company => nil
    ).as_new_record)
  end

  it "renders new book form" do
    render

    assert_select "form[action=?][method=?]", books_path, "post" do
      assert_select "input#book_name[name=?]", "book[name]"
      assert_select "textarea#book_description[name=?]", "book[description]"
      assert_select "input#book_company[name=?]", "book[company]"
    end
  end
end

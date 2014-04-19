require 'spec_helper'

describe "books/edit" do
  before(:each) do
    @book = assign(:book, stub_model(Book,
      :name => "MyString",
      :description => "MyText",
      :company => nil
    ))
  end

  it "renders the edit book form" do
    render

    assert_select "form[action=?][method=?]", book_path(@book), "post" do
      assert_select "input#book_name[name=?]", "book[name]"
      assert_select "textarea#book_description[name=?]", "book[description]"
      assert_select "input#book_company[name=?]", "book[company]"
    end
  end
end

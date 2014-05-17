require 'spec_helper'

describe "records/edit" do
  before(:each) do
    @record = assign(:record, stub_model(Record,
      :amount => "9.99",
      :description => "MyText",
      :book => nil,
      :status => 1
    ))
  end

  it "renders the edit record form" do
    render

    assert_select "form[action=?][method=?]", record_path(@record), "post" do
      assert_select "input#record_amount[name=?]", "record[amount]"
      assert_select "textarea#record_description[name=?]", "record[description]"
      assert_select "input#record_book[name=?]", "record[book]"
      assert_select "input#record_status[name=?]", "record[status]"
    end
  end
end

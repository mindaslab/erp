require 'spec_helper'

describe "records/new" do
  before(:each) do
    assign(:record, stub_model(Record,
      :amount => "9.99",
      :description => "MyText",
      :book => nil,
      :status => 1
    ).as_new_record)
  end

  it "renders new record form" do
    render

    assert_select "form[action=?][method=?]", finance_records_path, "post" do
      assert_select "input#record_amount[name=?]", "record[amount]"
      assert_select "textarea#record_description[name=?]", "record[description]"
      assert_select "input#record_book[name=?]", "record[book]"
      assert_select "input#record_status[name=?]", "record[status]"
    end
  end
end

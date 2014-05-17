require 'spec_helper'

describe "contacts/new" do
  before(:each) do
    assign(:contact, stub_model(Contact,
      :company => nil,
      :name => "MyString",
      :ph => "MyString",
      :email => "MyString",
      :address => "MyString",
      :city => "MyString",
      :zip => "MyString",
      :country => "MyString",
      :business => false,
      :customer => false,
      :supplier => false,
      :employee => false
    ).as_new_record)
  end

  it "renders new contact form" do
    render

    assert_select "form[action=?][method=?]", contacts_path, "post" do
      assert_select "input#contact_company[name=?]", "contact[company]"
      assert_select "input#contact_name[name=?]", "contact[name]"
      assert_select "input#contact_ph[name=?]", "contact[ph]"
      assert_select "input#contact_email[name=?]", "contact[email]"
      assert_select "input#contact_address[name=?]", "contact[address]"
      assert_select "input#contact_city[name=?]", "contact[city]"
      assert_select "input#contact_zip[name=?]", "contact[zip]"
      assert_select "input#contact_country[name=?]", "contact[country]"
      assert_select "input#contact_business[name=?]", "contact[business]"
      assert_select "input#contact_customer[name=?]", "contact[customer]"
      assert_select "input#contact_supplier[name=?]", "contact[supplier]"
      assert_select "input#contact_employee[name=?]", "contact[employee]"
    end
  end
end

require 'spec_helper'

describe "Records" do
  describe "GET /records" do
    it "works! (now write some real specs)" do
      get finance_records_path
      expect(response.status).to be(200)
    end
  end
end

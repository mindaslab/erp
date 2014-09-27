require 'spec_helper'

describe "Docs" do
  describe "GET /docs" do
    it "works! (now write some real specs)" do
      get docs_path
      expect(response.status).to be(200)
    end
  end
end

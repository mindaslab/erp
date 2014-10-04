require 'spec_helper'

describe "Notes" do
  describe "GET /notes" do
    it "works! (now write some real specs)" do
      get notes_path
      expect(response.status).to be(200)
    end
  end
end

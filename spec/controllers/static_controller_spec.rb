require 'spec_helper'

describe StaticController do

  describe "GET 'not_permitted'" do
    it "returns http success" do
      get 'not_permitted'
      expect(response).to be_success
    end
  end

end

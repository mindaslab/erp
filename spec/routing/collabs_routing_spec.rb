require "spec_helper"

describe CollabsController do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/collabs").to route_to("collabs#index")
    end

    it "routes to #new" do
      expect(:get => "/collabs/new").to route_to("collabs#new")
    end

    it "routes to #show" do
      expect(:get => "/collabs/1").to route_to("collabs#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/collabs/1/edit").to route_to("collabs#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/collabs").to route_to("collabs#create")
    end

    it "routes to #update" do
      expect(:put => "/collabs/1").to route_to("collabs#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/collabs/1").to route_to("collabs#destroy", :id => "1")
    end

  end
end

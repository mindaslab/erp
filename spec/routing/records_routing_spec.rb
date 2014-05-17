require "spec_helper"

describe RecordsController do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/records").to route_to("records#index")
    end

    it "routes to #new" do
      expect(:get => "/records/new").to route_to("records#new")
    end

    it "routes to #show" do
      expect(:get => "/records/1").to route_to("records#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/records/1/edit").to route_to("records#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/records").to route_to("records#create")
    end

    it "routes to #update" do
      expect(:put => "/records/1").to route_to("records#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/records/1").to route_to("records#destroy", :id => "1")
    end

  end
end

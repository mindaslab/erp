require "spec_helper"

describe DocsController do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/docs").to route_to("docs#index")
    end

    it "routes to #new" do
      expect(:get => "/docs/new").to route_to("docs#new")
    end

    it "routes to #show" do
      expect(:get => "/docs/1").to route_to("docs#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/docs/1/edit").to route_to("docs#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/docs").to route_to("docs#create")
    end

    it "routes to #update" do
      expect(:put => "/docs/1").to route_to("docs#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/docs/1").to route_to("docs#destroy", :id => "1")
    end

  end
end

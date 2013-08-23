require "spec_helper"

describe BridgesController do
  describe "routing" do

    it "routes to #index" do
      get("/bridges").should route_to("bridges#index")
    end

    it "routes to #new" do
      get("/bridges/new").should route_to("bridges#new")
    end

    it "routes to #show" do
      get("/bridges/1").should route_to("bridges#show", :id => "1")
    end

    it "routes to #edit" do
      get("/bridges/1/edit").should route_to("bridges#edit", :id => "1")
    end

    it "routes to #create" do
      post("/bridges").should route_to("bridges#create")
    end

    it "routes to #update" do
      put("/bridges/1").should route_to("bridges#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/bridges/1").should route_to("bridges#destroy", :id => "1")
    end

  end
end

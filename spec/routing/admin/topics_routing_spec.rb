require "spec_helper"

describe Admin::TopicsController do
  describe "routing" do

    it "routes to #index" do
      get("/admin/topics").should route_to("admin/topics#index")
    end

    it "routes to #new" do
      get("/admin/topics/new").should route_to("admin/topics#new")
    end

    it "routes to #show" do
      get("/admin/topics/1").should route_to("admin/topics#show", :id => "1")
    end

    it "routes to #edit" do
      get("/admin/topics/1/edit").should route_to("admin/topics#edit", :id => "1")
    end

    it "routes to #create" do
      post("/admin/topics").should route_to("admin/topics#create")
    end

    it "routes to #update" do
      put("/admin/topics/1").should route_to("admin/topics#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/admin/topics/1").should route_to("admin/topics#destroy", :id => "1")
    end

  end
end

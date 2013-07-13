require "spec_helper"

describe CardsController do
  describe "routing" do

    it "routes to #index" do
      get("/cards").should route_to("cards#index")
    end

    it "routes to #show" do
      get("/cards/1").should route_to("cards#show", :id => "1")
    end
    
  end
end

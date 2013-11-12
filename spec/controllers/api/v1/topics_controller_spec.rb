require 'spec_helper'

describe Api::V1::TopicsController do 
  describe "GET index" do 
    it "return AR list" do 
      FactoryGirl.create(:topic)
      FactoryGirl.create(:topic)
      
      get :index, use_route: "api/v1"
      
      response.should be_success
      response.should render_template :index
    end
  end
  
  describe "GET show" do 
    it "should return object" do 
      topic = FactoryGirl.create(:topic)
      
      get :show, 
        use_route: "api/v1/", 
        id: topic.id
        
      response.should be_success 
      assigns(:topic).should eq(topic)
    end
    
    it "should render the template" do 
      topic = FactoryGirl.create(:topic)
      
      get :show, 
        use_route: "api/v1/", 
        id: topic.id
        
      response.should be_success 
      response.should render_template :show
    end
  end
end

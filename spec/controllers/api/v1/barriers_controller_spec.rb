require 'spec_helper'

describe Api::V1::BarriersController do 
  
  before :all do 
    @topic = FactoryGirl.create(:topic)
    @b1 = FactoryGirl.create(:barrier, topic: @topic)
    @b2 = FactoryGirl.create(:barrier, topic: @topic)
  end
  
  describe "GET index" do 
    it "should render template" do 
      get :index, 
        use_route: "api/v1", 
        topic_id: @topic.to_param
        
      response.should be_success
      response.should render_template :index
    end
    
    it "should return @barriers" do
      get :index,
        use_route: "api/v1", 
        topic_id: @topic.to_param
        
      response.should be_success
      assigns(:barriers).should include(@b1)
      assigns(:barriers).should include(@b2)
    end
  end
  
  describe "GET show" do 
    it "should render template" do 
      get :show, 
        use_route: "api/v1", 
        topic_id: @topic.to_param, 
        id: @b1.to_param
        
      response.should be_success
      response.should render_template :show
    end
    
    it "should return @barrier" do 
      get :show, 
        use_route: "api/v1", 
        topic_id: @topic.to_param, 
        id: @b1.to_param
        
      response.should be_success
      assigns(:barrier).should eq(@b1)
    end
  end
end

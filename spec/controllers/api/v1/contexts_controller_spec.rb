require 'spec_helper'

describe Api::V1::ContextsController do 
  
  before :all do 
    @barrier = FactoryGirl.create(:barrier)
    @c1 = FactoryGirl.create(:context, barrier: @barrier)
    @c2 = FactoryGirl.create(:context, barrier: @barrier)
  end
  
  describe "GET index" do 
    it "should render template" do 
      get :index, 
        use_route: "api/v1", 
        barrier_id: @barrier.to_param
        
        response.should be_success
        response.should render_template :index
    end
    
    it "should return @contexts" do 
      get :index, 
        use_route: "api/v1", 
        barrier_id: @barrier.to_param
      
      assigns(:contexts).should include(@c1)
      assigns(:contexts).should include(@c2)
    end
  end
  
  describe "GET show" do 
    it "should render template" do 
      get :show, 
        use_route: "api/v1", 
        barrier_id: @barrier.to_param, 
        id: @c1.to_param
      
      response.should be_success
      response.should render_template :show
    end
    
    it "should return @context" do 
      get :show, 
        use_route: "api/v1", 
        barrier_id: @barrier.to_param,
        id: @c1.to_param
        
      assigns(:context).should eq(@c1)
    end
  end
end

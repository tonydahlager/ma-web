require 'spec_helper'

describe Api::V1::StepsController do 
  
  before :all do 
    @context = FactoryGirl.create(:context)
    @s1 = FactoryGirl.create(:step, context: @context)
    @s2 = FactoryGirl.create(:step, context: @context)
  end
  
  describe "GET index" do 
    it "should render template" do 
      get :index, 
        use_route: "api/v1", 
        context_id: @context.to_param
        
        response.should be_success
        response.should render_template :index
    end
    
    it "should return @steps" do 
      get :index, 
        use_route: "api/v1", 
        context_id: @context.to_param
      
      assigns(:steps).should include(@s1)
      assigns(:steps).should include(@s2)
    end
  end
  
  describe "GET show" do 
    it "should render template" do 
      get :show, 
        use_route: "api/v1", 
        context_id: @context.to_param, 
        id: @s1.to_param
      
      response.should be_success
      response.should render_template :show
    end
    
    it "should return @context" do 
      get :show, 
        use_route: "api/v1", 
        context_id: @context.to_param,
        id: @s1.to_param
        
      assigns(:step).should eq(@s1)
    end
  end
end

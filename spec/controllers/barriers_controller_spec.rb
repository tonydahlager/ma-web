require 'spec_helper'

describe BarriersController do   
  
  describe "GET index" do 
    it "should render template" do
      get :index
      response.should be_success
      response.should render_template :index    
    end
  end
  
  describe "GET show" do 
    it "should render template" do 
      barrier = FactoryGirl.create(:barrier)
      get :show, id: barrier.id.to_s
      response.should be_success
      response.should render_template :show
    end
  end
  
  describe "GET search" do 
    it "should render template" do 
      get :search
      response.should be_success
      response.should render_template :index
    end
  end
  
  
end

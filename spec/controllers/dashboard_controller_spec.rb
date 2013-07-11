require 'spec_helper'

describe DashboardController do 
  describe 'GET #index' do 
    it 'response should be successful' do 
      get :index
      response.should be_successful
    end
  end
end
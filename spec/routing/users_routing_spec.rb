require 'spec_helper'

describe Devise::RegistrationsController do 

  # routing specs meant to cover special devise setup.
  # 1. users should not be be able to sign up for site.
  # 2. users should be able to be invited to the site.

  it 'should not accept POST /users' do 
    post("/users").should_not route_to("action"=>"create", "controller"=>"devise_invitable/registrations")
  end

  it 'should enable users edit their profile' do 
    get('/users/edit').should route_to('devise/registrations#edit')
  end

  it 'should enable users to save profile edits' do 
    put('/users').should route_to("action"=>"update", "controller"=>"devise/registrations")
  end

  it 'should enable users to view invitation edit page' do 
    get('/users/invitation/accept').should route_to('devise/invitations#edit')
  end

  it 'should enable users to save invitation updates' do 
    put('/users/invitation').should route_to("controller"=>"devise/invitations", "action"=>"update")
  end
end
require 'spec_helper'

describe CardsController do

  describe "GET index" do
    it "assigns all cards as @cards" do
      get :index
      assigns(:cards).should eq(Card.all)
    end
  end

  describe "GET show" do
    it "assigns the requested card as @card" do
      card = FactoryGirl.create(:card)
      get :show, id: card.to_param
      assigns(:card).should eq(card)
    end
  end

end

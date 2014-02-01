class BarriersController < ApplicationController
  def index
    @barriers = Barrier.all
  end
  
  def show 
    @barrier = Barrier.find(params[:id])
  end
end

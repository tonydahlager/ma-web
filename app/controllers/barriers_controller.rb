class BarriersController < ApplicationController
  def index
  end
  
  def show 
    @barrier = Barrier.find(params[:id])
  end
  
  def search 
    # @barriers = Barrier.where(title: /#{params_search}/)
    @barriers = Barrier.all
    render :index
  end
  
  private 
    def params_search
      params.permit(:search_query)
    end
    
    def words_four_chars_or_greater
      result = []
      words = params_search.split(/\s/)
      words.map{ |word| result << word if word.length > 3 }
      result
    end
end

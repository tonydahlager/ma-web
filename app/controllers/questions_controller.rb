class QuestionsController < ApplicationController
  def index
    # @questions = Question.popular
  end
  
  def show 
    @question = Question.find(params[:id])
  end
  
  def search 
    # @questions = Question.where(title: /#{params_search}/)
    @questions = Question.all
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

class QuestionsController < ApplicationController
  def index
    # @questions = Question.popular
  end
  
  def show 
    @question = Question.find(params[:id])
  end
  
  def search
    significant_words = four_chars_or_more(params_search[:query]) 
    @questions = Question.full_text_search(significant_words)
    render :index
  end
  
  private 
    def params_search
      params.require(:search).permit(:query)
    end
    
    def four_chars_or_more(keywords)
      keywords.split(/\s/).select{ |word| word.length > 3 }
    end
end

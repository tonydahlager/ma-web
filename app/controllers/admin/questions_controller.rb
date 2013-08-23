class Admin::QuestionsController < ApplicationController
  before_action :set_topic # all actions
  before_action :set_question, only: [:show, :edit, :update, :destroy]

  # GET /admin/questions
  def index
    @questions = Question.all
    # @questions = @topic.questions
  end

  # GET /admin/questions/1
  def show
  end

  # GET /admin/questions/new
  def new
    @question = Question.new
  end

  # GET /admin/questions/1/edit
  def edit
  end

  # POST /questions
  def create    
    @question = @topic.questions.build(question_params)
    
    if @question.save
      redirect_to admin_topic_path(@topic), notice: 'Question was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /admin/questions/1
  def update
    if @question.update(question_params)
      redirect_to admin_topic_path(@topic), notice: 'Question was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /admin/questions/1
  def destroy
    @question.destroy
    redirect_to admin_topic_url(@topic), notice: 'Question was successfully destroyed.'
  end

  private
    # load the parent Topic object
    def set_topic 
      @topic = Topic.find(params[:topic_id])
    end
    
    # Use callbacks to share common setup or constraints between actions.
    def set_question
      @question = Question.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def question_params
      params.require(:question).permit(:topic_id, :content)
    end
end

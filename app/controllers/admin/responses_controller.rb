module Admin
  class ResponsesController < BaseController    
    before_action :set_topic
    before_action :set_question
    before_action :set_response, except: [:index, :new, :create]

    # GET /admin/topics/abc123/questions/xyz789/responses
    def index
      @responses = @question.responses
    end

    # GET /admin/topics/abc123/questions/xyz789/responses/ghi000
    def show
    end

    # GET /admin/topics/abc123/questions/xyz789/responses/new
    def new
      @response = Response.new
    end

    # GET /admin/topics/abc123/questions/xyz789/responses/ghi000/edit
    def edit
    end

    # POST /admin/topics/abc123/questions/xyz789/responses
    def create
      @response = @question.responses.build(response_params)

      if @response.save
        redirect_to [:admin, @topic, @question], notice: 'Response was successfully created.'
      else
        render action: 'new'
      end
    end

    # PATCH/PUT /admin/topics/abc123/questions/xyz789/responses/ghi000
    def update
      if @response.update(response_params)
        redirect_to [:admin, @topic, @question], notice: 'Response was successfully updated.'
      else
        render action: 'edit'
      end
    end

    # DELETE /admin/topics/abc123/questions/xyz789/responses/ghi000
    def destroy
      @response.destroy
      redirect_to [:admin, @topic, @question], notice: 'Direction was successfully destroyed.'
    end

    private
      def set_topic
        @topic = Topic.find(params[:topic_id])
      end
      
      def set_question
        @question = @topic.questions.find(params[:question_id])
      end
      
      def set_response
        @response = @question.responses.find(params[:id])
      end
      
      # Only allow a trusted parameter "white list" through.
      def response_params
        params.require(:response).permit(:content, :title, :group)
      end
  end
end

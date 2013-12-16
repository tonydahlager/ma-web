module Admin
  class TopicsController < BaseController
  
    before_action :set_topic, only: [:show, :edit, :update, :destroy]

    # GET /admin/topics
    def index
      @topics = Topic.all
    end

    # GET /admin/topics/1
    def show
      respond_to do |f|
        f.html  { render }
        
        f.pdf {
          
          # pdf = Prawn::Document.new
          # pdf.text "Title: #{@topic.title}"
          # pdf.text "Description: #{@topic.description}"
          
          # pdf.move_down 10
          # pdf.text "Topic Groups:"
          # @topic.topic_groups.each do |topic_group|
          #   pdf.text " =>  #{topic_group.title}"
          # end
          
          # pdf.move_down 20
          # pdf.text "Questions"
          
          # @topic.questions.each do |question|
          #   question.contexts.each do |context|
          #     pdf.text context == 0 ? "Default Context" : "Context #{context}"
          #     pdf.move_down 2
              
          #     # responses
          #     question.responses.select{ |r| context == r.context }.each do |response|
          #       pdf.text "-------- Response"
          #       pdf.text "Title: #{response.title}"
          #       pdf.text "Content: #{response.content}"
          #       pdf.move_down 10
          #     end
              
          #     # directions
          #     question.directions.select{ |d| context == d.context }.each do |direction|
          #       pdf.text "-------- Direction"
          #       pdf.text "Approach: #{direction.approach}"
          #       pdf.text "Cotent: #{direction.content}"
          #       pdf.move_down 10
          #     end
              
          #     # transitions
          #     question.transitions.select{ |t| context == t.context }.each do |transition|
          #       pdf.text "-------- Transition"
          #       pdf.text "Title: #{transition.title}"
          #       pdf.text "Content: #{transition.content}"
          #     end
              
          #     pdf.move_down 20
          #   end
          # end
          
          # send_data pdf.render, type: "application/pdf", disposition: "inline"
        }
      end
    end

    # GET /admin/topics/new
    def new
      @topic = Topic.new
    end

    # GET /admin/topics/1/edit
    def edit
    end

    # POST /admin/topics
    def create
      @topic = Topic.new(topic_params)

      if @topic.save
        redirect_to [:admin, @topic], notice: 'Topic was successfully created.'
      else
        render action: 'new'
      end
    end

    # PATCH/PUT /admin/topics/1
    def update
      if @topic.update(topic_params)
        redirect_to [:admin, @topic], notice: 'Topic was successfully updated.'
      else
        render action: 'edit'
      end
    end

    # DELETE /admin/topics/1
    def destroy
      @topic.destroy
      redirect_to admin_topics_url, notice: 'Topic was successfully destroyed.'
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_topic
        @topic = Topic.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def topic_params
        hash  = params.require(:topic).permit(:title, :description)
        
        # OBJECTIVE - come to 2 situations
        # 1. "topic_group_ids" => ["1", "2"]
        # 2. "topic_group_ids" => []
        # 
        tgids = params.require(:topic).permit(:topic_group_ids => [])
        topic_group_ids = tgids.empty? ? {"topic_group_ids" => []} : tgids
        new_hash = hash.merge(topic_group_ids)
    
        new_hash
      end
  
  end
end

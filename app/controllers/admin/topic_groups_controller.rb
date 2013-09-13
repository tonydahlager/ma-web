module Admin
  class TopicGroupsController < BaseController
  
    before_action :set_topic_group, only: [:show, :edit, :update, :destroy]

    # GET /admin/topics
    def index
      @topic_groups = TopicGroup.all
    end

    # GET /admin/topic_groups/1
    def show
    end

    # GET /admin/topic_groups/new
    def new
      @topic_group = TopicGroup.new
    end

    # GET /admin/topic_groups/1/edit
    def edit
    end

    # POST /admin/topics
    def create
      @topic_group = TopicGroup.new(topic_group_params)

      if @topic_group.save
        redirect_to [:admin, @topic_group], notice: 'Topic Group was successfully created.'
      else
        render action: 'new'
      end
    end

    # PATCH/PUT /admin/topic_group/1
    def update
      if @topic_group.update(topic_group_params)
        redirect_to [:admin, @topic_group], notice: 'Topic Group was successfully updated.'
      else
        render action: 'edit'
      end
    end

    # DELETE /admin/topic_groups/1
    def destroy
      @topic_group.destroy
      redirect_to admin_topic_groups_url, notice: 'Topic Group was successfully destroyed.'
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_topic_group
        @topic_group = TopicGroup.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def topic_group_params
        params.require(:topic_group).permit(:title)
      end
      
  end
end

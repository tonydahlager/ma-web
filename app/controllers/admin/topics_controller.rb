class Admin::TopicsController < ApplicationController
  
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
        
        pdf = Prawn::Document.new
        pdf.text "Title: #{@topic.title}"
        pdf.text "Description: #{@topic.description}"
        
        pdf.move_down 20
        pdf.text "Bridges"
        pdf.move_down 2
        @topic.bridges.each_with_index do |bridge, index|
          pdf.text "#{index} - #{bridge.content}"
          pdf.move_down 2
        end
        
        pdf.move_down 20
        pdf.text "Questions"
        pdf.move_down 2
        @topic.questions.each_with_index do |question, index|
          pdf.text "#{index} - #{question.content}"
          pdf.move_down 2
        end
        
        pdf.move_down 20
        pdf.text "Directions"
        pdf.move_down 2
        @topic.directions.each_with_index do |direction, index|
          pdf.text "#{index} - (Order #{direction.order}) #{direction.approach}"
          pdf.move_down 2
        end
        
        pdf.move_down 20
        pdf.text "Links"
        pdf.move_down 2
        @topic.links.each_with_index do |link, index|
          pdf.text "#{index} - #{link.content}"
          pdf.move_down 2
        end
        
        send_data pdf.render, type: "application/pdf", disposition: "inline"
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
      params.require(:topic).permit(:title, :description)
    end
end

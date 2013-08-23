class Admin::LinksController < ApplicationController
  before_action :set_topic
  before_action :set_link, only: [:show, :edit, :update, :destroy]

  # GET /links
  def index
    @links = @topic.links.all
  end

  # GET /links/1
  def show
  end

  # GET /links/new
  def new
    @link = Link.new
  end

  # GET /links/1/edit
  def edit
  end

  # POST /links
  def create
    @link = @topic.links.build(link_params)

    if @link.save
      redirect_to [:admin, @topic], notice: 'Link was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /links/1
  def update
    if @link.update(link_params)
      redirect_to [:admin, @topic], notice: 'Link was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /links/1
  def destroy
    @link.destroy
    redirect_to [:admin, @topic], notice: 'Link was successfully destroyed.'
  end

  private
    def set_topic
      @topic = Topic.find(params[:topic_id])
    end
    
    # Use callbacks to share common setup or constraints between actions.
    def set_link
      @link = @topic.links.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def link_params
      params.require(:link).permit(:kind, :content)
    end
end

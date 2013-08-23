class Admin::BridgesController < ApplicationController
  before_action :set_topic # all actions
  before_action :set_bridge, only: [:show, :edit, :update, :destroy]

  # GET /admin/bridges
  def index
    @bridges = Bridge.all
  end

  # GET /admin/bridges/1
  def show
  end

  # GET /admin/bridges/new
  def new
    @bridge = Bridge.new
  end

  # GET /admin/bridges/1/edit
  def edit
  end

  # POST /admin/bridges
  def create
    @bridge = @topic.bridges.build(bridge_params)
    
    if @bridge.save
      redirect_to [:admin, @topic], notice: 'Bridge was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /admin/bridges/1
  def update
    if @bridge.update(bridge_params)
      redirect_to [:admin, @topic], notice: 'Bridge was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /admin/bridges/1
  def destroy
    @bridge.destroy
    redirect_to [:admin, @topic], notice: 'Bridge was successfully destroyed.'
  end

  private
    # load the parent Topic object
    def set_topic 
      @topic = Topic.find(params[:topic_id])
    end
    
    # Use callbacks to share common setup or constraints between actions.
    def set_bridge
      @bridge = Bridge.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def bridge_params
      params.require(:bridge).permit(:content)
    end
end

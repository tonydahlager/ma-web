module Admin
  class QuotesController < BaseController    
    before_action :set_topic
    before_action :set_quote, only: [:show, :edit, :update, :destroy]

    # GET /quotes
    def index
      @quotes = @topic.quotes
    end

    # GET /quotes/1
    def show
    end

    # GET /quotes/new
    def new
      @quote = Quote.new
    end

    # GET /quotes/1/edit
    def edit
    end

    # POST /quotes
    def create
      @quote = @topic.quotes.build(quote_params)

      if @quote.save
        redirect_to [:admin, @topic], notice: 'Quote was successfully created.'
      else
        render action: 'new'
      end
    end

    # PATCH/PUT /quotes/1
    def update
      if @quote.update(quote_params)
        redirect_to [:admin, @topic], notice: 'Quote was successfully updated.'
      else
        render action: 'edit'
      end
    end

    # DELETE /quotes/1
    def destroy
      @quote.destroy
      redirect_to [:admin, @topic], notice: 'Direction was successfully destroyed.'
    end

    private
      def set_topic
        @topic = Topic.find(params[:topic_id])
      end
      
      # Use callbacks to share common setup or constraints between actions.
      def set_quote
        @quote = @topic.quotes.find(params[:id])
      end
      
      # Only allow a trusted parameter "white list" through.
      def quote_params
        params.require(:quote).permit(:content, :author)
      end
  end
end

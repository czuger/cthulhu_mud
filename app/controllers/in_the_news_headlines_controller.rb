class InTheNewsHeadlinesController < ApplicationController
  before_action :set_in_the_news_headline, only: [:show, :edit, :update, :destroy]

  # GET /in_the_news_headlines
  # GET /in_the_news_headlines.json
  def index
    @in_the_news_headlines = InTheNewsHeadline.all
  end

  # GET /in_the_news_headlines/1
  # GET /in_the_news_headlines/1.json
  def show
  end

  # GET /in_the_news_headlines/new
  def new
    @in_the_news_headline = InTheNewsHeadline.new
  end

  # GET /in_the_news_headlines/1/edit
  def edit
  end

  # POST /in_the_news_headlines
  # POST /in_the_news_headlines.json
  def create
    @in_the_news_headline = InTheNewsHeadline.new(in_the_news_headline_params)

    respond_to do |format|
      if @in_the_news_headline.save
        format.html { redirect_to @in_the_news_headline, notice: 'In the news headline was successfully created.' }
        format.json { render :show, status: :created, location: @in_the_news_headline }
      else
        format.html { render :new }
        format.json { render json: @in_the_news_headline.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /in_the_news_headlines/1
  # PATCH/PUT /in_the_news_headlines/1.json
  def update
    respond_to do |format|
      if @in_the_news_headline.update(in_the_news_headline_params)
        format.html { redirect_to @in_the_news_headline, notice: 'In the news headline was successfully updated.' }
        format.json { render :show, status: :ok, location: @in_the_news_headline }
      else
        format.html { render :edit }
        format.json { render json: @in_the_news_headline.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /in_the_news_headlines/1
  # DELETE /in_the_news_headlines/1.json
  def destroy
    @in_the_news_headline.destroy
    respond_to do |format|
      format.html { redirect_to in_the_news_headlines_url, notice: 'In the news headline was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_in_the_news_headline
      @in_the_news_headline = InTheNewsHeadline.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def in_the_news_headline_params
      params.require(:in_the_news_headline).permit(:headline)
    end
end

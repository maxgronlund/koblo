class Admin::NewsController < ApplicationController
  before_action :set_news, only: [:show, :edit, :update, :destroy]

  # GET /news
  # GET /news.json
  def index
    @news = News.all
  end

  # GET /news/1
  # GET /news/1.json
  def show
  end

  # GET /news/new
  def new
    @news = News.new
  end

  # GET /news/1/edit
  def edit
  end

  # POST /news
  # POST /news.json
  def create
    @news = News.new(news_params)
    if @news.save
      redirect_to admin_news_index_path
    else
      render new
    end

  end

  # PATCH/PUT /news/1
  # PATCH/PUT /news/1.json
  def update
    
    if @news.update(news_params)
      redirect_to admin_news_index_path
    else
      render :edit
    end
   
  end

  # DELETE /news/1
  # DELETE /news/1.json
  def destroy
    @news.destroy
    redirect_to admin_news_index_path
    
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_news
      @news = News.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def news_params
      params.require(:news).permit(:title, :body)
    end
end

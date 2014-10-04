class RemixesController < ApplicationController
  before_action :set_remix, only: [:show, :edit, :update, :destroy]

  # GET /remixes
  # GET /remixes.json
  def index
    @user = User.find(params[:user_id])
    @remixes = @user.remixes.all
  end

  # GET /remixes/1
  # GET /remixes/1.json
  def show
    @user = User.find(params[:user_id])
    case @remix.song_file
    when 'Ace of Base'
      @song_file = '/uploads/dta/dta_local.xml'
    when 'Nephew'
      @song_file = '/uploads/dtap/dtap_local.xml'
    end
      
  end

  # GET /remixes/new
  def new
    @user = User.find(params[:user_id])
    @remix = Remix.new
  end

  # GET /remixes/1/edit
  def edit
    @user = User.find(params[:user_id])
  end

  # POST /remixes
  # POST /remixes.json
  def create
    @user = User.find(params[:user_id])
    if @remix = Remix.create(remix_params)
      redirect_to user_remix_path(@user, @remix)
    else
      render new
    end
  end

  # PATCH/PUT /remixes/1
  # PATCH/PUT /remixes/1.json
  def update
    @user = User.find(params[:user_id])
    if @remix.update(remix_params)
      redirect_to user_remix_path(@user, @remix)
    else
      render edit
    end
      
    #respond_to do |format|
    #  if @remix.update(remix_params)
    #    format.html { redirect_to @remix, notice: 'Remix was successfully updated.' }
    #    format.json { render :show, status: :ok, location: @remix }
    #  else
    #    format.html { render :edit }
    #    format.json { render json: @remix.errors, status: :unprocessable_entity }
    #  end
    #end
  end

  # DELETE /remixes/1
  # DELETE /remixes/1.json
  def destroy
    @remix.destroy
    respond_to do |format|
      format.html { redirect_to remixes_url, notice: 'Remix was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_remix
      @remix = Remix.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def remix_params
      params.require(:remix).permit!
    end
end

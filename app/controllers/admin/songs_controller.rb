class Admin::SongsController < Admin::AdminController

  # load_and_authorize_resource

  def index
    # session[:admin_songs_page_number] = params[:page]

    sort_col = params[:sort] || "released_at"
    sort_order = params[:order] || "desc"
    
    # !!! fix later
    # Ordering
    #@songs = Song.order("#{sort_col} #{sort_order}").joins(:user.outer)
    @songs = Song.all

    # XXX: Filter out projects - remodel this
    @songs.reject! { |s| s.tracks.empty? }

    if params[:q] && params[:q].present?
      @search_results = @songs.search(params[:q]).reject(&:nil?)
    else
      # Split into three buckets
      @pending = nil # !!! AdminSongDecorator.decorate(@songs.unreleased)
      @future = nil # !!! @songs.future
      @current = nil # !! @songs.released
      
      # Pagination
      @current = @current.page(params[:page]).per(15) if @current

      # For some weird reason we have to do this to actually fetch stuff
      # !!! @current.all
    end
  end

  def edit
    @remix_usage_options = [["Sell without further notice", "sell_immediately"],
                            ["Sell after approval", "sell_after_approval"],
                            ["Preview", "preview"]]

    @tracks = resource.tracks
  end
  
  def update
    page = session.delete(:admin_songs_page_number)
    update! { admin_songs_path(:page => page) }
  end

  def destroy
    destroy! { admin_songs_path }
  end

  def upload
    if (f = params[:zip_file]).present?
      ImportsSong.from_zipfile(current_user, f)
      redirect_to admin_songs_path, notice: "Your upload has been queued"
    else
      redirect_to admin_songs_path, alert: "No file selected"
    end
  end

end

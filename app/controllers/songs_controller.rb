class SongsController < ApplicationController

  #before_filter :authenticate_user!, :only => [:create, :destroy]

  #include SongsHelper

  # FacebookPage ||= Struct.new(:id, :name)

  def index
    
    @songs = Song.all
    
    
    #@sort_by_options = [1,2,3,4].map(&:to_s)
    #@per_page_options = [16,32,48].map(&:to_s)
    #
    #@sort_by = params[:sort_by]
    #@per_page = (params[:per_page] || "16").to_i
    #@page = (params[:page] || "1").to_i
    #
    #if params[:q].present?
    #  @songs = Song.search(params[:q] + '*')
    #elsif params[:genre_id].present?
    #  @genre = Genre.find(params[:genre_id])
    #  @songs = @genre.try(:songs) || Song.scoped
    #elsif params[:label_id].present?
    #  @label = RecordLabel.find(params[:label_id])
    #  @songs = @label.try(:songs) || Song.scoped
    #else
    #  @songs = Song.all
    #end
    #
    #@total_num_songs = @songs.count
    #@songs = @songs.page(@page).per(@per_page)
    #
    #@from_song_no = [(@page - 1) * @per_page + 1, @total_num_songs].min
    #@to_song_no = [@from_song_no + @per_page - 1, @total_num_songs].min
    #
    ## XXX
    #@featured_songs = Song.featured(4)
  end

  def buy
    @song = Song.find(params[:id])
  end

  def studio
    #if true #current_user.try(:admin?)
    #  # Admin can preview anything
    #  @song = Song.find(params[:id])
    #  ap @song
    #else
    #  @song = Song.find(params[:id])
    #  # Due to a bug in CanCan we cannot express that songs with no user id should be accessible
    #  @song ||= Song.where(:id => params[:id], :user_id => nil).first
    #  if @song && !@song.accept_remixes?
    #    redirect_to :root, :notice => "Remixes not allowed" and return
    #  end
    #
    #  # Claim the song
    #  @song.update_attribute(:user, current_user) if @song.user.blank? && user_signed_in?
    #end
    #
    #@render = params[:render].present? if true#remix_bought?(@song)
  end

  def show
    #@song = Song.find(params[:id])
    #@num_tracks = @song.tracks.size
    #
    #controls_height = 64
    #track_height = 38
    #@previewer_height = @num_tracks * track_height + controls_height
    #@previewer_width = 648
    #
    ##@song = SongDecorator.decorate(song)
    #
    #respond_to do |format|
    #  format.html do
    #    #@remixes = SongDecorator.decorate(Song.released.limit(4))
    #  end
    #  
    #  format.xml
    #  format.json { render :status => 200, :json => { :id => @song.id } }
    #end
    #
    #@hide_banner = true
    ##@twitter_username = @song.user.twitter_username
    ##@show_tweets = @twitter_username.present?
  end

  def preview
    #@song = Song.find(params[:id])
    #respond_to do |format|
    #  format.xml
    #end
  end

  def add_to_basket
    #@song = Song.find(params[:id])
    #respond_to do |format|
    #  format.js   { render :add_to_basket, :layout => nil }
    #end
  end

  def share
    #@song = Song.find(params[:id])
    #@user = User.find(params[:user_id] || current_user.id)
    #@user = current_user unless can? :manage, @user
    #if @user.connected_to_facebook?
    #  @facebook_pages = [FacebookPage.new(@user.authentications.facebook.first.uid, 'My own Facebook wall')]
    #  @facebook_pages += @user.facebook_accounts.reject { |fb_account| fb_account.name.blank? }.map { |fb_account| FacebookPage.new(fb_account.identifier, fb_account.name) }.sort_by(&:name)
    #end
    #@show_done_popup = params[:show_done_popup].present?
  end

  def best
    #params[:scope] = 'best'
    #index
  end

  def newest
    #params[:scope] = 'newest'
    #index
  end

  def most_downloaded
    #params[:scope] = 'most_downloaded'
    #index
  end

  def remixes
    #@original = Song.find(params[:id])
    #@remixes = @original.remixes.with_user.reject(&:project?)
    #@remix_layout = true
  end

  # XXX not in use
  def nonce
    #session[:nonce] ||= {}
    #@player_id = params['playerId']
    #@song_id = Song.find(params[:id]).id
    #@nonce = SecureRandom.hex(32)
    ## Destroy old nonces
    #SongNonce.destroy_all(:session_id => session_id, :song_id => @song_id)
    ## And create a new one
    #SongNonce.create(:session_id => session_id, :nonce => @nonce, :song_id => @song_id)
    #respond_to do |format|
    #  format.js
    #end
  end

  # def preview
  #   head(:not_found) and return unless song = Song.find(params[:id])
  #   head(:forbidden) and return unless DownloadValidityToken.valid_nonce?(params[:nonce])
  #   send_file(song.mixdown.path)
  # end
  
  def download
    #head(:not_found) and return unless song = Song.find(params[:id])
    #
    #case params[:track_format]
    #when "multitrack"
    #  head(:forbidden) and return unless multitrack_bought?(song) || (song.user == current_user && !song.remix?)
    #  path = song.multitrack_zip_file.path 
    #when "mixdown"
    #  head(:forbidden) and return unless mp3_bought?(song)
    #  path = song.mixdown.path
    #else
    #  head(:not_found) and return
    #end
    #
    #head(:bad_request) and return unless File.exist?(path)
    #
    #content_disposition = "attachment; filename=\"#{File.basename(path)}\""
    #send_file(path, :type => MIME::Types.type_for(path).to_s)
  end

  def buy
    #song = Song.find(params[:id])
    #@cart.add_item(song)
    #redirect_to songs_path
  end


  def update_mixdown_tier
    #if params[:remixOfId].present?
    #  @song = Song.find(params[:remixOfId])
    #  respond_to { |format| format.js }
    #end
  end
end

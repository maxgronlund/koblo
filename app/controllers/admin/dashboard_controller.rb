class Admin::DashboardController < Admin::AdminController
  respond_to :html, :json

  def index
    @user_count = User.count
    @song_count = Song.count
    @songs_sold_count = Song.sold_count
  end

  def user_count
    respond_with(User.count)
  end

  def song_count
    respond_with(Song.count)
  end

  def songs_sold_count
    respond_with(Song.sold_count)
  end
end

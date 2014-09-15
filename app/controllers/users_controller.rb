class UsersController < ApplicationController
  # load_and_authorize_resource

  # before_filter :sidebar_for_user, :only => [:show, :my_music, :earnings]
  # before_filter :sidebar_for_frontpage, :only => :index
  before_filter :set_download_nonce, :only => :my_music

  def show
    if current_user == @user
      redirect_to user_activities_path(@user)
    else
      redirect_to user_songs_path(@user)
    end
  end

  def index
    unless params[:record_label_id].blank?
      @record_label = RecordLabel.find(params[:record_label_id])
      @users = User.where(:record_label_id => @record_label)
      @banner = @record_label.banners.random.first
    else
      @users = params[:letter].present? ? User.starting_with(params[:letter]) : User.scoped
    end

    if params[:artists].present?
      @users = @users.artists
    end

    @users = @users.alphabetical
  end


  def my_music
    redirect_to user_songs_path(@user) and return unless can? :manage, @user

    @originals = @user.original_songs
    @remixes = @user.remixes
    @purchases = @user.purchased_songs
    @projects = @user.projects
  end

  def earnings
    redirect_to user_songs_path(@user) and return unless can? :manage, @user

    Money.default_bank = Money::Bank::GoogleCurrency.new

    @to   = params[:to]   || Date.today.beginning_of_month
    @from = params[:from] || @to - 1.month
  end
end

class UsersController < ApplicationController
  before_filter :authenticate_user!

  def index
    @users = User.all
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    @user.update_attributes(user_params)
    redirect_to @user
  end

  def show
    

    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to :back, :alert => "Access denied."
    end
    if params[:remix_id]
      remix = Remix.find(params[:remix_id])

      Remix.where(  
                    user_id:      current_user.id, 
                    price:        remix.price,
                    title:        remix.title,
                    original_id:  remix.original_id,
                    song_file:    remix.song_file,
                    remixer:      current_user.name,
                    track_count:  remix.track_count,  
                    original_mix: false
                  )
            .first_or_create(
                    user_id:      current_user.id, 
                    price:        remix.price,
                    image:        File.open("#{Rails.root}/public/#{remix.image_url}"),
                    original_id:  remix.original_id,
                    song_file:    remix.song_file,
                    remixer:      current_user.name,
                    track_count:  remix.track_count,
                    original_mix: false
            
                  )

    end
  end
  
  private
  
  def user_params
    params.require(:user).permit!
  end

end

class Admin::UsersController < Admin::AdminController

  # load_and_authorize_resource

  def index
    session[:admin_users_page_number] = params[:page]

    # Allow for ordering by user type and record label
    #@users = User.joins(:user_type.outer)
    #@users = @users.joins(:record_label.outer)
    ## Ordering
    #@users = @users.order("#{params[:sort]} #{params[:order]}")
    ## Search
    #@users = @users.where(:name.matches => params[:q] + "%") if params[:q].present?
    @users = User.all
    # Pagination
    #@users = @users.page(params[:page]).per(15)

    respond_to do |format|
      format.html
      format.json { render :json => User.where(:name.matches => "%#{params[:q]}%").map(&:attributes) }
    end
  end

  def update
    @user = resource
    @user.role = params[:user][:role]
    @user.featured = params[:user].delete(:featured)
    if params[:user][:password].blank?
      params[:user].delete(:password)
      params[:user].delete(:password_confirmation)
    end
    page = session.delete(:admin_users_page_number)
    update! { admin_users_path(:page => page) }
  end

  def destroy
    page = session.delete(:admin_users_page_number)
    destroy! { admin_users_path(:page => page) }
  end

  def create
    super { admin_users_path }
  end

end

class RegistrationsController < ApplicationController
  def create
    if user = User.find_by_email(params[:user][:email])
      if user.valid_password? params[:user][:password]
        params[:user].delete(:email)
        params[:user].delete(:password)
        params[:user].delete(:password_confirmation)
      else
        user = nil
      end
    end
    build_resource
    resource.manager_id = user.id if user
    logger.error resource.inspect

    # Generate a password
    if session['devise.omniauth_info'].present? && resource.password.blank?
      password = Devise.friendly_token[0,20]
      resource.password = password
      resource.password_confirmation = password
    end

    if resource.save
      # result = @mixpanel.track_event("Sign up")
      # logger.error "MixPanel returned #{result}"
      if params[:record_label_name].present? && resource.record_label.blank?
        resource.update_attribute(:record_label, RecordLabel.create(:name => params[:record_label_name], :admin => resource))
      end
      resource.update_token(session['devise.omniauth_info']) if session['devise.omniauth_info'].present?
      set_flash_message :notice, :signed_up
      sign_in(resource_name, resource)

      if session[:after_sign_in_path]
        @redirect_to = session.delete(:after_sign_in_path)
      else
        @redirect_to = successful_sign_in_path
      end

      respond_to do |format|
        format.html { redirect_to @redirect_to }
        format.js
      end
    else
      logger.error resource.errors.inspect
      clean_up_passwords(resource)
      render :action => 'new'
    end
  end

  def edit
    user = User.find(params[:id])
    self.resource = user if can? :manage, user
  end

  def update
    # Don't update the password if the field is empty
    if params[:user][:password].blank?
      [:password, :password_confirmation].each { |field| params[:user].delete(field) }
    end

    if params[:user][:email].blank?
      params[:user].delete(:email)
    end

    @user = User.find(params[:id])
    @user = nil unless can? :manage, @user
    @user.update_attributes(params[:user])

    if @user.errors.present?
      flash[:alert] = "Unable to update profile: " + @user.errors.full_messages.join(", ")
    else
      flash[:notice] = "Profile updated"
    end

    respond_to do |format|
      format.html { redirect_to successful_sign_in_path }
      format.js
    end
  end
end

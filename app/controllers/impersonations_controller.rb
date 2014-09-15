class ImpersonationsController < ApplicationController

  before_filter :require_record_label_admin_or_admin, :only => 'create'

  def create
    # Store the current user's id
    #session["admin_user_id"] = current_user.id
    #user = User.find(params[:user_id])
    #sign_out :user
    #sign_in user
    redirect_to admin_path
  end

  def destroy
    #prev_user = User.find(session["admin_user_id"])
    #sign_out :user
    #request.reset_session
    #sign_in prev_user
    redirect_to admin_path
  end

  #private
  #def require_record_label_admin_or_admin
  #  raise "Unauthorized" unless current_user && (current_user.admin? || current_user.record_label_admin? || current_user.managed_artists.present?)
  #end
end

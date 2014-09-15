class Admin::AdminController < ApplicationController
  layout 'admin'
  before_filter :require_admin

  helper_method :impersonating?

  def impersonating?
    session[:admin_user_id].present?
  end
end

class PasswordsController < ApplicationController
  def edit
    # What? 
    # redirect_to(beta_path(:reset_password_token => params[:reset_password_token])) and return unless params[:dialog].present?
    super
  end

  def create
    #self.resource = resource_class.send_reset_password_instructions(params[resource_name])
    #
    #if resource.errors.empty?
    #  set_flash_message :notice, :send_instructions
    #  respond_to do |format|
    #    format.html { redirect_to root_path }
    #    format.js
    #  end
    #else
    #  flash[:error] = resource.errors.first.join(' ')
    #  render_with_scope :new
    #end
  end

end

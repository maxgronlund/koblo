class Admin::AdminMessagesController < Admin::AdminController

  # respond_to :js, :only => [:edit, :new]

  def index
    #@admin_messages = AdminMessage.page(params[:page]).per(10)
  end

  def create
    #create! { admin_admin_messages_path }
  end

  def update
    #update! { admin_admin_messages_path }
  end

  def destroy
    #destroy! do |format|
    #  format.html do
    #    redirect_to(admin_admin_messages_path, :notice => "Message \"#{@admin_message.title}\" destroyed.")
    #  end
    #end
  end
end


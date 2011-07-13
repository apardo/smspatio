class MessageController < ApplicationController

  before_filter :login_required

  def create
    if request.post?
      message = Message.new
      message.body = params[:message][:body]
      message.user_id = current_user.id
      if message.save
        flash[:notice] = "Mensaje recibido, en menos de 5 minutos se distribuirá."
        redirect_to :controller => "site", :action => "index"
      else
        flash[:notice] = "El mensaje no es correcto, vuelve a redactarlo."
        redirect_to :controller => "site", :action => "index"
      end
    else
      redirect_to :controller => "site", :action => "index"
    end
  end
end

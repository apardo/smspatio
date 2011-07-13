class ContactController < ApplicationController

  before_filter :login_required

  def create
    if request.post?
      contact = Contact.new
      contact.phone = params[:contact][:phone]
      if contact.save
        flash[:notice] = "El número de móvil ha sido añadido correctamente."
        redirect_to :controller => "site", :action => "index"
      else
        flash[:notice] = "El número de móvil no es correcto o ya está en la base de datos."
        redirect_to :controller => "site", :action => "index"
      end
    else
      redirect_to :controller => "site", :action => "index"
    end
  end
end

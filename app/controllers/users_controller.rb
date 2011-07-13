class UsersController < ApplicationController
  # Be sure to include AuthenticationSystem in Application Controller instead
  include AuthenticatedSystem
  
  layout "auth"
  
  def activate
    logout_keeping_session!
    user = User.find_by_activation_code(params[:activation_code]) unless params[:activation_code].blank?
    case
    when (!params[:activation_code].blank?) && user && !user.active?
      user.activate!
      flash[:notice] = "Registro completado. Ya puedes conectar."
      redirect_to '/login'
    when params[:activation_code].blank?
      flash[:error] = "El código de activación no está. Por favor sigue la URL de tu correo."
      redirect_back_or_default('/')
    else 
      flash[:error]  = "No encontramos el código de activación. Revisa tu correo."
      redirect_back_or_default('/')
    end
  end
end

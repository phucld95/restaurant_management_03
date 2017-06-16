class SessionsController < ApplicationController
  def create
    admin = Admin.find_by email: session_params[:email].downcase
    if admin && admin.authenticate(session_params[:password])
      log_in admin
      redirect_to admin
    else
      flash.now[:danger] = t "admin.error_wrongpass"
      render :new
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end

  private
  def session_params
    params.require(:session).permit :email, :password
  end
end

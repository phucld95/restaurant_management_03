class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionHelper

  private
  def logged_in_admin
    unless logged_in?
      flash[:danger] = t "admin.error_log"
      redirect_to login_url
    end
  end

  def find_admin
    @admin = Admin.find_by id: params[:id]
    unless @admin
      flash[:danger] = t "admin.not_exist"
      redirect_to root_path
    end
  end
end

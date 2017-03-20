class AdminsController < ApplicationController
  before_action :logged_in_admin
  before_action :find_admin

  def show
    unless @admin
      flash[:danger] = t "admin.error_log"
      redirect_to root_url
    end
  end
end

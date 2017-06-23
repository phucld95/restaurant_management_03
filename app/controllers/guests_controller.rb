class GuestsController < ApplicationController
  def new
    @guest = Guest.new
  end

  def index
    guest_params_code = guest_params[:code]
    if guest_params_code.present?
      find_guest guest_params_code
      update_guest @guest
    end
  end

  def create
    @guest = Guest.new guest_params
    if @guest.save
      update_guest @guest
      flash[:success] = t "guest.success_create"
    else
      flash[:danger] = t "guest.fail_create"
      redirect_to root_path
    end
  end

  private
  def guest_params
    params.require(:guest).permit :name, :email, :phone_num, :code
  end

  def find_guest code
    @guest = Guest.find_by code: code
    flash[:danger] = t "guest.not_found" unless @guest
  end
end

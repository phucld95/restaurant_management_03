class GuestsController < ApplicationController
  def new
    @guest = Guest.new
  end

  def create
    @guest = Guest.new guest_params
    if @guest.save
      current_guest @guest
      flash[:success] = t "guest.success_create"
    else
      flash[:danger] = t "guest.fail_create"
      redirect_to root_path
    end
  end

  private
  def guest_params
    params.require(:guest).permit :name, :email, :phone_num
  end
end

class TablesController < ApplicationController
  def index
    @guest = Guest.new
    @tables =
      if params[:table].present?
        timein = table_params[:orders_time_in_eq].to_time
        hour = 2.hours
        time_in_before = (timein + hour).strftime("%H:%M")
        time_in_after = (timein - hour).strftime("%H:%M")
        Table.get_table table_params[:capacity_gteq],
          table_params[:orders_day_eq], time_in_before, time_in_after
      else
        Table.all
      end
    respond_to do |format|
      format.html
      format.json{render json: @tables}
    end
  end

  private
  def table_params
    params.require(:table).permit :orders_day_eq, :capacity_gteq,
      :orders_time_in_eq
  end
end

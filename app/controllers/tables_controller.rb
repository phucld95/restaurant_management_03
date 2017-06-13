class TablesController < ApplicationController
  def index
    @guest = Guest.new
    day = table_params[:orders_day_eq]
    @tables =
      if day
        Table.get_table table_params[:capacity_gteq],
          day, table_params[:orders_time_in_eq]
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
    params.require(:table).permit :orders_day_eq, :capacity_gteq, :orders_time_in_eq
  end
end

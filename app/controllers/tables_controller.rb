class TablesController < ApplicationController
  def index
    @guest = Guest.new
    @tables =
      if params[:table].present?
        Table.get_table table_params[:capacity_gteq],
          table_params[:orders_day_eq], table_params[:orders_time_in_eq]
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

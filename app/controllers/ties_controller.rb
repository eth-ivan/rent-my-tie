class TiesController < ApplicationController
  def index
    if params[:query]
      sql_query = "name @@ :query OR description @@ :query"
      @ties = Tie.where(sql_query, query: "%#{params[:query]}%")
    else
      @ties = Tie.all
    end
  end

  def new
    @tie = Tie.new
  end

  def create
    @tie = Tie.new(tie_params)
    @tie.user = current_user # temporary, to be able to save the tie
    if @tie.save
      redirect_to @tie
    else
      render :new # render method is necessary so that simple form displays error messages
    end
  end

  private

  def tie_params
    params.require(:tie).permit(:name, :description, :price_per_day, :picture)
  end
end

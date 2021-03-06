class TiesController < ApplicationController
  def index
    if params[:query]
      sql_query = "name @@ :query OR address @@ :query OR description @@ :query"
      @ties = Tie.where(sql_query, query: "%#{params[:query]}%")
    else
      @ties = Tie.all
    end
  end

  def show
    @tie = Tie.find(params[:id])
    @markers =
      {
        lat: @tie.latitude,
        lng: @tie.longitude,
      }
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

  def map
    @ties = Tie.all
    @markers = @ties.geocoded.map do |tie|
      {
        lat: tie.latitude,
        lng: tie.longitude,
        # render_to_string sert à construire du html depuis une partial
        # c'est le même principe que le render dans la view, mais pour le controlleur
        infoWindow: render_to_string(partial: "info_window", locals: { tie: tie }),
      }
    end
  end

  private

  def tie_params
    params.require(:tie).permit(:name, :description, :price_per_day, :picture, :address)
  end
end

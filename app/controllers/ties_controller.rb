class TiesController < ApplicationController
  def index
    if params[:query]
      query = params[:query]
      @ties = Tie.where("name LIKE ?", "%#{query}%")
    else
      @ties = Tie.all
    end
  end

  def show
    @tie = Tie.find(params[:id])
  end

  def new
    @tie = Tie.new
  end

  def create
    @tie = Tie.new(tie_params)
    @tie.user_id = 1 # temporary, to be able to save the tie
    if @tie.save
      redirect_to @tie
    else
      render :new # render method is necessary so that simple form displays error messages
    end
  end

  private

  def tie_params
    params.require(:tie).permit(:description, :price_per_day, :picture)
  end
end

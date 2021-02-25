class TiesController < ApplicationController
  def index
  end

  def new
    @tie = Tie.new
  end

  def create
    @tie = Tie.new(tie_params)
    if @tie.save
      redirect_to @tie
    else
      render :new # il faut render pour afficher le message d'erreur
    end
  end

  private

  def tie_params
    params.require(:tie).permit(:description, :price_per_day)
  end
end

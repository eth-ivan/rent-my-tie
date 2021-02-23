class TiesController < ApplicationController
  def index
    @ties_to_rent=Tie.all
  end

end

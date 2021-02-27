class PagesController < ApplicationController
  def home
    @ties = Tie.all.take(3)
  end
end

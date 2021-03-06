class PagesController < ApplicationController
  def home
    @ties = Tie.all.shuffle.take(3)
  end
end

class PagesController < ApplicationController
  def dashboard
    @games = Game.all
  end
end

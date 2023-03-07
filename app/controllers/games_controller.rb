class GamesController < ApplicationController
  before_action :set_game, only: [:show, :edit, :update, :destroy]
  before_action :game_params, only: [:new, :create]

  def index
    @games = Game.all
  end

  def show
    @home_club = @game.club_home
    @away_club = @game.club_away
    @referee = @game.referee
    @reports = @game.reports
  end

  def new
    @game = Game.new
    @clubs = Club.all
    @referees = User.where(role: "referee")
  end

  def create
    @game.competition = @competition
    if @game.save
      redirect_to games_path, notice: "Game created"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @clubs = Club.all
    @referees = User.where(role: "referee")
  end

  def update
    if @game.update(game_params)
      redirect_to game_path(@game), notice: "Game was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @game.destroy
    redirect_to games_path, notice: "Game was successfully destroyed."
  end

  private

  def game_params
    params.require(:game).permit(:competition_id, :club_home_id, :club_away_id, :referee_id, :game_date)
  end

  def set_game
    @game = Game.find(params[:id])
  end
end

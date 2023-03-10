class GamesController < ApplicationController
  before_action :set_game, only: [:show, :edit, :update, :destroy]

  def index
    @games = Game.all
  end

  def show
  end

  def new
    @competition = Competition.find(params[:competition_id])
    @game = Game.new
    @referees = User.where(role: "referee")
  end

  def create
    @competition = Competition.find(params[:competition_id])
    @game = Game.new(game_params)
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
    params.require(:game).permit(:club_home_id, :club_away_id, :referee_id, :game_date)
  end

  def set_game
    @game = Game.find(params[:id])
  end
end

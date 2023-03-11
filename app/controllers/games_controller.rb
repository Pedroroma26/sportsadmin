class GamesController < ApplicationController
  before_action :set_game, only: [:show, :edit, :update, :destroy]

  def index
    @competitions = Competition.all
    if params[:competition_id]
      @games = Game.where(competition_id: params[:competition_id])
    else
      @games = Game.all
    end
  end

  def show
  end

  def new
    @competition = Competition.find(params[:competition_id])
    @game = @competition.games.build
    @referees = User.where(role: "referee")
  end

  def create
    @competition = Competition.find(params[:competition_id])
    @game = @competition.games.new(game_params)

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

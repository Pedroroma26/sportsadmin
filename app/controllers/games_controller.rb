class GamesController < ApplicationController
  before_action :set_game, only: [:show, :edit, :update, :destroy]

  def index
    @competitions = Competition.all
    if params[:competition_id]
      @competition = Competition.find(params[:competition_id])
      @games = @competition.games.order(game_date: :desc)
      @new_game = @competition.games.build
      @referees = User.where(role: "referee")
    else
      @games = Game.order(game_date: :desc)
    end
  end

  def show
    @games = Game.geocoded
    @markers = @games.map do |game|
      {
        lat: game.latitude,
        lng: game.longitude,
        info_window_html: render_to_string(partial: "shared/info_window", locals: {game: game}),
        marker_html: render_to_string(partial: "shared/marker", locals: {game: game})
      }
    end
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
      redirect_to games_path(competition_id: @competition.id), notice: "Game created"
    else
      @referees = User.where(role: "referee")
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

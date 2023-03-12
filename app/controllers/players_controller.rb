class PlayersController < ApplicationController
  before_action :set_club

  def new
    @player = Player.new
  end

  def create
    @player = @club.players.build(player_params)

    if @player.save
      redirect_to club_players_path, notice: 'Player created'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def index
    @players = @club.players
  end

  def show
  end

  def edit
  end

  def update
    if @player.update(player_params)
      redirect_to club_player_path(@club, @player), notice: 'Player updated'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @player.destroy
    redirect_to club_path(@club), notice: 'Player deleted'
  end

  private

  def set_club
    @club = Club.find(params[:club_id])
  end

  def player_params
    params.require(:player).permit(:first_name, :last_name, :birth_date, :gender, :player_number)
  end
end

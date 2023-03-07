class PlayersController < ApplicationController
  before_action :set_club

  def new
    @player = Player.new
  end

  def create
    @player = Player.new(player_params)
    @player.club = @club

    if @player.save
      redirect_to club_path(@club), notice: 'player created'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_club
    @club = Club.find(params[:club_id])
  end

  def player_params
    params.require(:player).permit(:first_name, :last_name, :birth_date, :gender)
  end
end

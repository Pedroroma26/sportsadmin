class PlayersController < ApplicationController
  
  def new
    @player = Player.new
  end

  def create
    @player = Player.new(player_params)

    if @player.save
      redirect_to club_players_path, notice: 'player created'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def player_params
    params.require(:player).permit(:first_name, :last_name, :birth_date, :gender, :club_id)
  end
end

class ClubsController < ApplicationController

  def index
    @clubs = Club.all
  end

  def show
    @club = Club.find(params[:id])
  end

  private

  def club_params
    params.require(:club).permit(:name, :abreviation, :address, :email, :phone_number)
  end
end

class ClubsController < ApplicationController

  def index
    @clubs = Club.all
  end

  def show
    @clubs = Club.find(params[:id])
  end

  private

  def clubs_params
    params.require(:clubs).permit(:name, :abreviation, :address, :email, :phone_number)
  end
end

class ClubsController < ApplicationController

  def index
    @clubs = Club.all
  end

  def new
    @club = Club.new
  end

  def show
    @club = Club.find(params[:id])
  end

  def create
    @club = Club.new(club_params)

    if @club.save
      redirect_to clubs_path, notice: "Club created successfully"
    else
      render :new
    end
  end

  def edit
    @club = Club.find(params[:id])
  end

  def destroy
    @club = Club.find(params[:id])
    @club.destroy

    redirect_to clubs_path, notice: "Club deleted successfully"
  end


  private

  def club_params
    params.require(:club).permit(:name, :abreviation, :address, :email, :phone_number, :photo)
  end
end

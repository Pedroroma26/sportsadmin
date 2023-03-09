class RefereesController < ApplicationController
  before_action :set_referee, only: [:show, :edit, :update, :destroy]

  def index
    @referees = User.referee
  end

  def show
  end

  def new
    @referee = User.new
    @referees = User.where(role: :referee)
  end

  def create
    @referee = User.new(referee_params)
    @referee.role = :referee
    if @referee.save
      redirect_to referees_path, notice: "Referee created"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @referees = User.where(role: :referee)
  end

  def update
    if @referee.update(referee_params)
      redirect_to referee_path(@referee), notice: "Referee was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @referee.destroy
    redirect_to games_path, notice: "Referee was successfully destroyed."
  end

  private

  def referee_params
    params.require(:user).permit(:first_name, :last_name, :birth_date, :email, :phone_number, :city)
  end

  def set_referee
    @referee = User.find(params[:id])
  end
end

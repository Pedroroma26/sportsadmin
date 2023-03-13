class CompetitionsController < ApplicationController

  def index
    @competitions = Competition.order(created_at: :desc)
  end

  def new
    @competition = Competition.new
  end

  def create
    @competition = Competition.new(competition_params)

    if @competition.save
      redirect_to competitions_path, notice: "Competition created successfully"
    else
      render :new
    end
  end

  def show
    @competition = Competition.find(params[:id])
  end

  def edit
    @competition = Competition.find(params[:id])
  end

  def update
    @competition = Competition.find(params[:id])

    if @competition.update(competition_params)
      redirect_to competitions_path, notice: "Competition updated successfully"
    else
      render :edit
    end
  end

  def destroy
    @competition = Competition.find(params[:id])
    @competition.destroy

    redirect_to competitions_path, notice: "Competition deleted successfully"
  end

  private

  def competition_params
    params.require(:competition).permit(:name)
  end
end

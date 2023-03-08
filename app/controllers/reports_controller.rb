class ReportsController < ApplicationController
  def index
    @reports = Report.all
  end

  def new
    @game = Game.find(params[:game_id])
    @report = Report.new
  end

  def create
    @report = Report.new(report_params)
    @report.user = current_user
    if @report.save
      redirect_to games_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @report = Report.find(params[:id])
  end

  def update
    @report = Report.find(params[:id])
    if @report.update(report_params)
      redirect_to reports_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @report = report.find(params[:id])
    @report.destroy
    redirect_to reports_path, status: :see_other
  end

  private

  def report_params
    params.require(:report).permit(:start_time, :end_time, :pitch_id)
  end
end

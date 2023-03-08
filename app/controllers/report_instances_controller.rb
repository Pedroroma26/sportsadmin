class ReportInstancesController < ApplicationController

  def create
    @report = Report.find(params[:report_id])
    @report_instance = ReportInstance.new(report_instance_params)
    @report_instance.report = @report

    if @report_instance.save
      respond_to do |format|
        format.html { redirect_to game_report_path(@report.game, @report) }
        format.json { render json: @report_instance }
      end
    else
      respond_to do |format|
        format.html { render "reports/show", status: :unprocessable_entity }
        format.json { render json: @report_instance }
      end
    end
  end

  private

  def report_instance_params
    params.require(:report_instance).permit(:player_id, :category, :minute, :motive)
  end
end

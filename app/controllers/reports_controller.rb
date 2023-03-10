class ReportsController < ApplicationController

  def index
    @reports = Report.all
  end

  def show
    @game = Game.find(params[:id])
    @report = @game.report

    if @report.blank?
      @report = Report.create(game: @game, referee_validation: false)
    end

    @report_instance = ReportInstance.new
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
      respond_to do |format|
        format.html { redirect_to reports_path }
        format.text { render partial: "shared/final_report", locals: { report: @report, game: @report.game, report_instance: ReportInstance.new }, formats: [:html] }
      end
    else
      respond_to do |format|
        format.html { render :edit, status: :unprocessable_entity }
        format.text { render partial: "shared/final_report", locals: { report: @report, game: @report.game, report_instance: ReportInstance.new }, formats: [:html] }
      end
    end
  end

  def destroy
    @report = report.find(params[:id])
    @report.destroy
    redirect_to reports_path, status: :see_other
  end

  private

  def report_params
    params.require(:report).permit(:start_time, :end_time, :pitch_id, :referee_validation)
  end
end

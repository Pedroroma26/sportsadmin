class ReportsController < ApplicationController

  def index
    @reports = Report.all
    @competitions = Competition.all
    if params[:competition_id]
      @competition = Competition.find(params[:competition_id])
      @games = @competition.games.order(game_date: :desc)
    else
      @games = Game.order(game_date: :desc)
    end
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
      ReportMailer.ask_for_game_report_validation_email(@report, @report.game.club_home).deliver
      ReportMailer.ask_for_game_report_validation_email(@report, @report.game.club_away).deliver

      respond_to do |format|
        format.html { redirect_to reports_path }
        format.text { render partial: "shared/new_final_report", locals: { report: @report, game: @report.game, report_instance: ReportInstance.new }, formats: [:html] }
      end
    else
      respond_to do |format|
        format.html { render :edit, status: :unprocessable_entity }
        format.text { render partial: "shared/new_final_report", locals: { report: @report, game: @report.game, report_instance: ReportInstance.new }, formats: [:html] }
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

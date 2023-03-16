class PublicReportsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show]
  before_action :set_report, :set_club

  layout "public"

  def show
    if @club.nil? || @report.nil? || ![@report.game.club_home.id, @report.game.club_away.id].include?(@club.id)
      redirect_to root_path
    end
  end

  def update
    if params[:report][@club.name] == "1"

      if @club == @report.game.club_away
        report_attributes = {
          club_away_validation: DateTime.now
        }
      elsif @club == @report.game.club_home
        report_attributes = {
          club_home_validation: DateTime.now
        }
      end

      if @report.update(report_attributes)
        message = "Report validated"
      else
        message = "Sorry, try again later!"
      end
    else
      message = "Please validate the report."
    end

    redirect_to({action: "show", id: params[:id], token: @token}, notice: message)
  end

  private

  def set_club
    @token = params[:token]
    @club = Club.find_by(access_token: @token)
  end

  def set_report
    @report = Report.find(params[:id])
  end
end

class PublicReportsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show]

  layout "public"

  def show
    @report = Report.find(params[:id])
    @club = Club.find_by(access_token: params[:token])

    if @club.nil? || @report.nil? || ![@report.game.club_home.id, @report.game.club_away.id].include?(@club.id)
      redirect_to root_path
    end
  end
end

class PublicReportsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show]

  layout "public"

  def show
    @report = Report.find(params[:id])
    @club = Club.find_by(params[:token])

    if @club.nil? || @report.nil? #|| @report.include(@club)
      raise
      redirect_to root_path
    end
  end
end

#@report.game.club_home.access_token

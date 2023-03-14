class PublicReportsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show]
  layout "public"

  def show
    @report = Report.find(params[:id])
  end
end

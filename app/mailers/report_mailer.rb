class ReportMailer < ApplicationMailer
  default from: "me@sandbox99ea2ebf478743528f7a354f1a55c3bc.com"

  def ask_for_game_report_validation_email(report, club)

    @report = report
    @club = club

    mail to: club.email, subject: "Match Report Validation for #{report.game.club_home.name} and #{report.game.club_away.name}"
  end
end

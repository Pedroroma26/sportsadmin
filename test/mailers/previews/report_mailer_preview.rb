# Preview all emails at http://localhost:3000/rails/mailers/report_mailer
class ReportMailerPreview < ActionMailer::Preview
  
  def ask_for_game_report_validation_email

    report = Report.new(game: game3, referee_validation: true)

    ReportMailer.with(report: report).ask_for_game_report_validation_email
  end
end

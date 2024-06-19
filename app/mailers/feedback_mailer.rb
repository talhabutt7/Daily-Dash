class FeedbackMailer < ApplicationMailer
  def send_feedback_email
    @feedback = params[:feedback]
    mail(from: @feedback.email, subject: @feedback.subject, body: @feedback.body)
  end
end

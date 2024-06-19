class FeedbackController < ApplicationController
  def new
    @feedback = Feedback.new
  end

  def create
    @feedback = Feedback.new(feedback_params)
    if @feedback.valid?
      # Send email
      FeedbackMailer.with(feedback: @feedback).send_feedback_email.deliver_now
      redirect_to feedback_path, notice: 'Feedback sent successfully.'
    else
      render :new
    end
  end

  private

  def feedback_params
    params.require(:feedback).permit(:email, :subject, :body)
  end
end
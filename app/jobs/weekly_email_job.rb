class WeeklyEmailJob < ApplicationJob
  queue_as :default

  def perform(user_id)
    user = User.find(user_id)
    WeeklyMailer.weekly_email(user).deliver_now if user.weekly_email
  end
end

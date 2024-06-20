namespace :weekly_email do
  desc "Enqueue weekly emails"
  task send: :environment do
    User.where(weekly_email: true).find_each do |user|
      WeeklyEmailJob.perform_later(user.id)
    end
  end
end

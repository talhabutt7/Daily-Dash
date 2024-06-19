# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


# Create a User
user = User.where(email: "admin@admin.com").first_or_initialize
user.update!(
  email: 'admin@admin.com',
  password: 'password',
  first_name: 'Talha',
  last_name: 'Butt',
  username: 'admin',
  date_of_birth: Date.new(1990, 1, 1),
  weekly_email: true,
  accept_terms: true
)

# Attach profile image (if using Active Storage)
file_path = Rails.root.join('app', 'assets', 'images', 'profile_pic.jpg')
user.profile_image.attach(io: File.open(file_path), filename: 'profile_pic.jpg', content_type: 'image/jpg')

# Output to console
puts "User created with email: #{user.email}"
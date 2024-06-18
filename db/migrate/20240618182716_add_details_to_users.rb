class AddDetailsToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :profile_image, :string
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :username, :string
    add_column :users, :date_of_birth, :date
    add_column :users, :weekly_email, :boolean
    add_column :users, :terms_and_conditions, :boolean
  end
end

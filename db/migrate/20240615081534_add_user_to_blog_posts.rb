class AddUserToBlogPosts < ActiveRecord::Migration[7.1]
  def change
    # Add the user reference without the NOT NULL constraint first
    add_reference :blog_posts, :user, foreign_key: true

    # Update existing blog posts to associate with the first user (or any default user)
    # This is a temporary measure; adjust as needed
    BlogPost.reset_column_information
    user = User.first
    BlogPost.update_all(user_id: user.id) if user.present?

    # Now add the NOT NULL constraint
    change_column_null :blog_posts, :user_id, false
  end
end

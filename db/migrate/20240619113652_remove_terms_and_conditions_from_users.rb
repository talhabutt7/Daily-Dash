class RemoveTermsAndConditionsFromUsers < ActiveRecord::Migration[7.1]
  def change
    remove_column :users, :terms_and_conditions, :boolean
  end
end

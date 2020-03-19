class AddColumnsToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :image_url, :text
    add_column :users, :access_token, :string
    add_column :users, :refresh_token, :string
    add_column :users, :token_expired_at, :datetime
  end
end

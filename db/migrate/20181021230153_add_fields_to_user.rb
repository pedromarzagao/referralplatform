class AddFieldsToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :fullname, :string
    add_column :users, :username, :string, unique: true
    add_column :users, :login_token, :string
    add_column :users, :token_generated_at, :datetime
  end
end

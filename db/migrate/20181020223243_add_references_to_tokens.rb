class AddReferencesToTokens < ActiveRecord::Migration[5.2]
  def change
    add_foreign_key :token, :affiliate
  end
end

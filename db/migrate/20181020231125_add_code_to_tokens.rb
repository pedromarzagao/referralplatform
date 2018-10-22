class AddCodeToTokens < ActiveRecord::Migration[5.2]
  def change
    add_column :tokens, :code, :string
  end
end

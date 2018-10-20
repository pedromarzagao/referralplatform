class AddNameAndEmailToAffiliate < ActiveRecord::Migration[5.2]
  def change
    add_column :affiliates, :firstname, :string
    add_column :affiliates, :email, :string
  end
end

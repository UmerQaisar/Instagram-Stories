class AddFieldsToUser < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :long_lived_access_token, :string, default: ""
    add_column :users, :expiry_date, :datetime
  end
end

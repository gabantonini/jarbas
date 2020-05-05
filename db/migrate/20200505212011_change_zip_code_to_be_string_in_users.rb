class ChangeZipCodeToBeStringInUsers < ActiveRecord::Migration[6.0]
  def change
    change_column :users, :zip_code, :string
  end
end

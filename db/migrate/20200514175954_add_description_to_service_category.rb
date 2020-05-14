class AddDescriptionToServiceCategory < ActiveRecord::Migration[6.0]
  def change
    add_column :service_categories, :description, :string
  end
end

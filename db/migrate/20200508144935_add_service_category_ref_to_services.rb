class AddServiceCategoryRefToServices < ActiveRecord::Migration[6.0]
  def change
    add_reference :services, :service_category, foreign_key: true
  end
end

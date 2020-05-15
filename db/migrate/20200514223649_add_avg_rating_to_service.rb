class AddAvgRatingToService < ActiveRecord::Migration[6.0]
  def change
    add_column :services, :avg_rating, :float
  end
end

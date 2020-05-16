class CreateUserCalendars < ActiveRecord::Migration[6.0]
  def change
    create_table :user_calendars do |t|
      t.date :date
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end

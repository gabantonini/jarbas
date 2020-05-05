class CreateServices < ActiveRecord::Migration[6.0]
  def change
    create_table :services do |t|
      t.string :name
      t.text :description
      t.references :category, null: false, foreign_key: true
      t.integer :price
      t.integer :time_to_answer
      t.string :disponibility
      t.references :user, null: false, foreign_key: true
      t.references :condominio, null: false, foreign_key: true

      t.timestamps
    end
  end
end

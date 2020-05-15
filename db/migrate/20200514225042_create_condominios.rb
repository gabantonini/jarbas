class CreateCondominios < ActiveRecord::Migration[6.0]
  def change
    create_table :condominios do |t|
      t.string :name

      t.timestamps
    end
  end
end

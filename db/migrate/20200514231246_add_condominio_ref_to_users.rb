class AddCondominioRefToUsers < ActiveRecord::Migration[6.0]
  def change
    add_reference :users, :condominio, foreign_key: true
  end
end

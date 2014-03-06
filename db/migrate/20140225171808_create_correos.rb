class CreateCorreos < ActiveRecord::Migration
  def change
    create_table :correos do |t|
      t.string :nombre
      t.string :login
      t.string :pass
      t.integer :cantidad_disponible
      t.integer :cantidad_enviados
      t.integer :cantidad_restantes
      t.date  :fecha

      t.timestamps
    end
  end
end

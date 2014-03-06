class CreateUniversidades < ActiveRecord::Migration
  def change
    create_table :universidades do |t|
      t.string :nombre
      t.integer :ciudad_id
      t.string  :abreviacion
      t.string  :tipo

      t.timestamps
    end
  end
end

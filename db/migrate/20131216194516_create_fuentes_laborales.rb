class CreateFuentesLaborales < ActiveRecord::Migration
  def change
    create_table :fuentes_laborales do |t|
      t.string :nombre
      t.string :direccion
      t.string :correoe
      t.integer :fono
      t.integer :fax
      t.string :web
      t.integer :ciudad_id

      t.timestamps
    end
  end
end

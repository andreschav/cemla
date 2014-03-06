class CreatePersonas < ActiveRecord::Migration
  def change
    create_table :personas do |t|
      t.integer :ci
      t.string :nombre
      t.string :apaterno
      t.string :amaterno
      t.string :sexo
      t.integer :profesion_id
      t.string :fono_ofi
      t.string :fono_casa
      t.string :fono_movil
      t.integer :tipo_id
      t.date :fecha_nac
      t.string :file_foto
      t.string :file_ci
      t.string :file_titulo
      t.integer :universidad_id
      t.integer :cargo_id

      t.timestamps
    end
  end
end

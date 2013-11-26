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
      t.string :correoe
      t.integer :tipo_id
      t.date :fecha_nac
      t.integer :file_foto
      t.integer :file_ci
      t.integer :file_titulo

      t.timestamps
    end
  end
end

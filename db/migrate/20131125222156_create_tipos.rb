class CreateTipos < ActiveRecord::Migration
  def change
    create_table :tipos do |t|
      t.string :nombre

      t.timestamps
    end
  end
end

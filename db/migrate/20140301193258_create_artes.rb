class CreateArtes < ActiveRecord::Migration
  def change
    create_table :artes do |t|
      t.string :invitacion_file
      t.string :nombre

      t.timestamps
    end
  end
end

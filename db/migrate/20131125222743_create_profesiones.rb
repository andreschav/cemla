class CreateProfesiones < ActiveRecord::Migration
  def change
    create_table :profesiones do |t|
      t.string :nombre

      t.timestamps
    end
  end
end

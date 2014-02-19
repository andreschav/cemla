class CreateUniversidades < ActiveRecord::Migration
  def change
    create_table :universidades do |t|
      t.string :nombre
      t.integer :ciudad_id

      t.timestamps
    end
  end
end

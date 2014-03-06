class CreateCuentasCorreos < ActiveRecord::Migration
  def change
    create_table :cuentas_correos do |t|
      t.string :correoe
      t.integer :persona_id

      t.timestamps
    end
  end
end

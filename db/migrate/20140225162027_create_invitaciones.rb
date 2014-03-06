class CreateInvitaciones < ActiveRecord::Migration
  def change
    create_table :invitaciones do |t|
      t.string :nombre
      t.string :asunto
      t.string :logo
      t.text :cabeza
      t.text :cuerpo
      t.text :pie
      t.date :fecha
      t.string :tipo_adjunto

      t.timestamps
    end
  end
end

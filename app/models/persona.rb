class Persona < ActiveRecord::Base
  attr_accessible :cuentas_correos_attributes, :usuario_attributes, :amaterno, :apaterno, :ci, :fecha_nac, :file_ci, :file_foto, :file_titulo, :fono_casa, :fono_movil, :fono_ofi, :nombre, :profesion_id, :sexo, :tipo_id, :universidad_id, :cargo_id
  belongs_to :profesion
  belongs_to :tipo
  belongs_to :universidad
  has_one :usuario
  has_many :cuentas_correos
  mount_uploader :file_ci, ImageUploader
  mount_uploader :file_foto, ImageUploader
  mount_uploader :file_titulo, ImageUploader

  accepts_nested_attributes_for :usuario
  accepts_nested_attributes_for :cuentas_correos

  def nombre_completo
    self.nombre + " " + self.apaterno + " " + self.amaterno
  end
end

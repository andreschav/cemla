class Persona < ActiveRecord::Base
  attr_accessible :amaterno, :apaterno, :ci, :correoe, :fecha_nac, :file_ci, :file_foto, :file_titulo, :fono_casa, :fono_movil, :fono_ofi, :nombre, :profesion_id, :sexo, :tipo_id
end

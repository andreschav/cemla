class Universidad < ActiveRecord::Base
  attr_accessible :ciudad_id, :nombre, :abreviacion, :tipo
  belongs_to :ciudad
  has_many :personas

  def nombre_ciudad
    self.nombre + " (#{self.ciudad.nombre})"
  end
end

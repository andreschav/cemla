class Correo < ActiveRecord::Base
  attr_accessible :login, :nombre, :pass ,:cantidad_disponible,:cantidad_enviados, :cantidad_restantes, :fecha
end

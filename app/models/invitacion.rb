class Invitacion < ActiveRecord::Base
  attr_accessible :nombre ,:asunto, :logo ,:cabeza, :cuerpo, :pie, :fecha, :tipo_adjunto
  mount_uploader :logo, ImageUploader
end

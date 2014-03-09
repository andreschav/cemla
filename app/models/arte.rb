class Arte < ActiveRecord::Base
  attr_accessible :invitacion_file, :nombre
  mount_uploader :invitacion_file,  ImageUploader
end

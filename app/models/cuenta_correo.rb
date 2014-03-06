class CuentaCorreo < ActiveRecord::Base
  attr_accessible :correoe, :persona_id
  belongs_to :persona
end

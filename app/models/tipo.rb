class Tipo < ActiveRecord::Base
  attr_accessible :nombre
  has_one :persona
end

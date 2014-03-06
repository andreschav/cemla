class Ciudad < ActiveRecord::Base
  attr_accessible :nombre
  has_many :universidades
end

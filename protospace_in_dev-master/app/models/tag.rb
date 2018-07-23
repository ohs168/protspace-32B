class Tag < ActiveRecord::Base
  has_many :prototypes through: :tied_tags
  has_many :tied_tags
end

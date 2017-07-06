class Tag < ActiveRecord::Base
  has_many :absorptions
  has_many :pictures, through: :absorptions

  validates :name, :presence => true




end

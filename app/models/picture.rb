class Picture < ApplicationRecord
  has_many :tags
  has_many :users, through: :associations

  
end

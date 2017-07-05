class Picture < ApplicationRecord
  has_attached_file :image, :styles => { :original => "922x922>", :thumb => "220x220>" }
  has_many :tags
  has_many :users, through: :associations

  validates_attachment :image, content_type: { content_type: ["image/jpeg", "image/gif", "image/png"] }

end

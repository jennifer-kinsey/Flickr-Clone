class Absorption < ApplicationRecord
  belongs_to :picture
  belongs_to :tag

  validates :tag_id, :picture_id, :presence => true
end

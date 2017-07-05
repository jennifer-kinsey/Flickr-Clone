class Tag < ActiveRecord::Base
  validates :name, :picture_id, :presence => true
  belongs_to :picture, foreign_key: :picture_id, optional: true
end

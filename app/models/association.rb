class Association < ApplicationRecord
  belongs_to :picture
  belongs_to :user

  validates :user_id, :picture_id, :typification, :presence => true
end

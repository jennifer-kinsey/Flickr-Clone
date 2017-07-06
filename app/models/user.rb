class User < ApplicationRecord
  has_many :associations
  has_many :pictures, through: :associations
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable



  validates :email, :encrypted_password, :avatar_url, :presence => true

end

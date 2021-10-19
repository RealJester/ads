class User < ApplicationRecord
  has_many :advertisments, dependent: :destroy
  
  extend Enumerize
  enumerize :role, in: [:user, :admin], default: :user

  devise :database_authenticatable, 
         :registerable,
         :recoverable, 
         :rememberable, 
         :validatable,
         :omniauthable
end

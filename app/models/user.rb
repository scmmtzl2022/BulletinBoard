class User < ApplicationRecord
  belongs_to :created_user, class_name: "User", foreign_key: "create_user_id"
  belongs_to :updated_user, class_name: "User", foreign_key: "updated_user_id"

  has_secure_password

  validates :name, presence: true
  validates :email,presence: true, uniqueness: true , format: { with: /\A[^@\s]+@([^@.\s]+\.)+[^@.\s]+\z/ }
  validates :password,presence: true
  
  # image
  has_one_attached :profile
end

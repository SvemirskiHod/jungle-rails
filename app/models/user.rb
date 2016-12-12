class User < ActiveRecord::Base

  has_secure_password
  has_many :reviews
  validates :email, uniqueness: { case_sensitive: false }

  validates :first_name, presence: true
  validates :email, presence: true
  validates :last_name, presence: true
  validates :password, presence: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true

end


class User < ActiveRecord::Base


before_save { self.email = email.downcase }

has_secure_password

has_many :articles


validates :username, presence: true, uniqueness: {case_sensitive: false}, length: {minimum: 3, maximum: 25}
VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
validates :email, presence: true, uniqueness: true, length: {minimum: 5, maximum: 25}, format: { with: VALID_EMAIL_REGEX }
validates :password, length: {minimum: 3, maximum: 10}

end

class User < ActiveRecord::Base

validates :username, presence: true, length: {minimum: 3, maximum: 50}
validates :email, presence: true, length: {minimum: 4, maximum: 30}

end
class User < ActiveRecord::Base
	

	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

	validates :name, presence: true
	validates :email, presence: true, 
										uniqueness: { case_sensitive: false },
										format: { with: VALID_EMAIL_REGEX }
	
	before_save { self.email.downcase! }

	has_secure_password
	validates :password, length: { minimum: 6 }

end

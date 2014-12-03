class User < ActiveRecord::Base
	

	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

	validates :name, presence: true
	validates :email, presence: true, 
										uniqueness: { case_sensitive: false },
										format: { with: VALID_EMAIL_REGEX }
	
	before_save { self.email.downcase! }

	has_secure_password
	validates :password, length: { minimum: 6 }

  # Returns the hash digest of the given string.
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end
  
end

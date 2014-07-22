class User < ActiveRecord::Base

	validates :username,  presence: true, length: { maximum: 50 }, uniqueness: { case_sensitive: true }
	has_secure_password
	validates :password, length: { minimum: 6 }
	before_create :create_remember_token

  has_many :book_ownership
  has_many :books, :through => :book_ownership
	def User.new_remember_token
    	SecureRandom.urlsafe_base64
  	end

  	def User.digest(token)
    	Digest::SHA1.hexdigest(token.to_s)
  	end

  	private

    	def create_remember_token
      		self.remember_token = User.digest(User.new_remember_token)
    	end
end

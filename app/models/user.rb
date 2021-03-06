class User < ActiveRecord::Base

	has_many :movies
	has_many :tags, through: :movies
    
    attr_accessor :password
	before_save :encrypt_password
	before_create { generate_token(:auth_token)}

	validates :password, presence:true, confirmation: true
	validates :email, presence: true, length: {maximum: 50}, uniqueness: true





  def self.authenticate(email, password)
		user = User.find_by_email(email)
		#if user exists and the password matches encrypted pw then return the user
		if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
			user 
		else
			nil
		end
	end

	def encrypt_password
		if password.present?
			self.password_salt = BCrypt::Engine.generate_salt
			self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
		end
	end

	def generate_token(column)
		begin
			self[column] = SecureRandom.urlsafe_base64
		end while User.exists?(column => self[column])
	end

end

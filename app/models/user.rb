# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  email           :string(255)      not null
#  password_digest :string(255)      not null
#  session_token   :string(255)      not null
#  created_at      :datetime
#  updated_at      :datetime
#

class User < ActiveRecord::Base
	before_validation :ensure_session_token
	validates :email, :password_digest, :session_token, presence: true
	validates :email, uniqueness: true
	validates :password, length: {minimum: 6, allow_nil: true}

	attr_accessor :password

	def self.find_by_credentials(email, password)
		user = User.find_by_email(email)
		return nil if user.nil?
		user.is_password?(password) ? user : nil
	end

	def self.reset_session_token!
		self.session_token = SecureRandom.hex
		self.save!
		self.session_token
	end

	def password=(password)
		if password.present?
			@password = password
			self.password_digest = BCrypt::Password.create(password)
		end
	end

	def is_password?(password)
		BCrypt::Password.new(self.password_digest).is_password?(password)
	end

	def ensure_session_token
		self.session_token ||= SecureRandom.hex
	end

end

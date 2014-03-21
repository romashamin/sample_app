class User < ActiveRecord::Base
	before_save do 
		self.email = email.downcase
		self.phone = phone.downcase
	end

	validates :name, presence: true
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  	validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }
  	validates :phone, presence: true
                   
end

class User < ActiveRecord::Base
	attr_accessor :password_verify, :password

	validates_presence_of :password, :salt, :username

	validates_length_of :username, :minimum => 6 
	validates_length_of :password, :minimum => 6 
	# validates_length_of :salt, :minimum => 6 
end

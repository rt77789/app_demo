class User < ActiveRecord::Base
	attr_accessor :password_verify, :password, :salt, :username
end

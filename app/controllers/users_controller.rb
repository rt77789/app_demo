class UsersController < ApplicationController

	def login
		@user = User.new
	end

	def list
		@users = User.find(:all)
	end

	def new
		@user = User.new
	end

	def create
		@user = User.new(params[:user])
		if(@user.password !=@user.password_verify)
			flash[:notice] = "password != password_verify"
			redirect_to :action => :new
		else
			@user.salt = ActiveSupport::SecureRandom.base64(8)
			@user.password = Digest::SHA256.hexdigest(@user.password + @user.salt)

			if(@user.save)
				flash[:notice] = "save ok."
			else
				flash[:notice] = "save fail."
			end
			redirect_to :action => :new
		end

	end

	protected

end

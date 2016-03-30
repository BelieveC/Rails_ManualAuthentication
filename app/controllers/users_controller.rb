class UsersController < ApplicationController
	def signup
		@user = User.new
	end

	def create
		@user = User.new(params.require(:user).permit(:email,:password)
		if @user.save
			redirect_to('signup',notice:"Successfully Signed Up")
		else
			render('signup')
		end
	end
end
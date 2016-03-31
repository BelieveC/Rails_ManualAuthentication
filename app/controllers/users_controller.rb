class UsersController < ApplicationController
	def signup
		@user = User.new
	end

	def create
		@user = User.new(params.require(:user).permit(:email,:password))
		if @user.save
			redirect_to(root_path,notice:"Successfully Signed Up")
		else
			render('signup')
		end
	end
	def login
	end

	def login_attempt
		if params[:email].present? && params[:password].present?
			@found_user = User.where(email: params[:email]).first
			if @found_user
				@au = @found_user.authenticate(params[:password])
			else
				flash[:notice] = "Incorrect Email"
				render('login')
			end
		else
			flash[:notice] = "Blank Fields"
		end

		if @au
			flash[:notice] = "Successfully Logged In"
			redirect_to root_path
		else
			flash[:notice] = "Incorrect Password"
			render('login')
		end
	end
end

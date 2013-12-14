class SessionsController < ApplicationController
	
	def new
	end

	def create
		user = User.find_by(email: params[:email].downcase)
		if user && user.authenticate(params[:password])
			sign_in user
			redirect_back_or user
			#Sign in the user and redirect to user's show page.
		else
			flash.now[:error] = "Invalid email/password combination" #not quite right!
			render 'new'
		end
	end

	def destroy
		sign_out
		redirect_to root_url
	end
end

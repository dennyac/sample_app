class SessionsController < ApplicationController

	def new
		@title_app = "Sign in"
  end

  def create
  	user = User.find_by_email(params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      sign_in user
      redirect_to user
    else
      flash.now[:error] = 'Invalid email/password combination'
      @title_app = "Sign in"
      render 'new'
    end
  end

  def destroy
    sign_out
    redirect_to root_url
  end
end
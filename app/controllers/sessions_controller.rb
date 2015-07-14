class SessionsController < ApplicationController
  def new
  end

  def create
  	@user = User.find_by(email: session_params[:email])
  	if @user && @user.authenticate(session_params[:password])
  		log_in @user # => SESSION COOKIE(S) BAKED!
  		redirect_to :controller => "projects", :action => "index"
  	else
	  	render 'new'
	  end
  end

  def destroy
  	log_out
  	redirect_to root_url
  end

  private
    def session_params
      params.require(:session).permit(:email, :password)
    end
end

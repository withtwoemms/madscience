class SessionsController < ApplicationController
  def new
  end

  def create
  	@user = User.find_by(email: params[:session][:email])
  	if @user && @user.authenticate(params[:session][:password])
  		log_in @user # => SESSION COOKIE(S) BAKED!
  		# redirect_to :controller => "projects", :action => "index"
  	else
	  	render 'new'
	  end
  end

  def destroy
  	log_out
  	redirect_to root_url
  end
end

class SessionsController < ApplicationController
  def new
  end

  def create
  	if @user.authenticate

  	else
	  	render 'new'
	  end
  end

  def destroy
  end
end

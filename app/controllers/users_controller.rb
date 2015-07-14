class UsersController < ApplicationController

	def index 
		@projects = Project.all
	end

	# def show
	# 	@user
	# 	render "users/show"
	# end

  def new
  	@new_user = User.new
  end

  # def edit
  # 	# user profile
  # end

  def create # FACULTY ONLY -- need faculty code (or something) to authorize
  	# new faculty
  	if @user.is_faculty?
	  	@new_user = User.new(user_params)
	  	@user.position = Position.new(title: "faculty")
	    if @user.save
	    	@user.position.save
	      # flash[:notice] = "You signed up successfully"
	      # flash[:color]= "valid"
	      redirect_to :controller => "sessions", :action =>"create"
	    else
	      # flash[:notice] = "Form is invalid"
	      # flash[:color]= "invalid"
	    	render "new"
	    end
	  end
  end

  private
  	def user_params
  		params.require(:user).permit(:first_name , :last_name, :email, :password)
  	end

  	def is_faculty?
  		session[:position] == "faculty"
 	  end
end

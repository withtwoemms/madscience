class UsersController < ApplicationController

	def index 
		@projects = Project.all
	end

	def show
		# @user
		# render "users/show"
	end

  def new
  	@user = User.new
  end

  # def edit
  # 	# user profile
  # end

  def create # FACULTY ONLY -- need faculty code to authorize
  	# new faculty
  	@user = User.new(user_params)
  	@user.position = Position.new(title: "faculty")
    if @user.save
    	 @user.position.save
      flash[:notice] = "You signed up successfully"
      flash[:color]= "valid"
      redirect_to show
    else
      flash[:notice] = "Form is invalid"
      flash[:color]= "invalid"
    	render "new"
    end
  end

  private
  	def user_params
  		params.require(:user).permit(:first_name , :last_name, :email, :password)
  	end
end

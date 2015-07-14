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
  	@new_user = User.new(user_params)

  	if position_params 
  		@new_user.position = Position.find_by(title: "faculty")
  	else
  		@new_user.position = Position.find_by(title: "staff")
  	end


    if @new_user.save
      # flash[:notice] = "You signed up successfully"
      # flash[:color]= "valid"
      redirect_to :controller => "sessions", :action =>"create"
    else
      # flash[:notice] = "Form is invalid"
      # flash[:color]= "invalid"
    	render "new"
    end
  end

private
	def user_params
		params.require(:user).permit(:first_name , :last_name, :email, :password)
	end

	def position_params
		if params[:position]
			return params.require(:position).permit(:title)
		end
	end

	def is_faculty?
		@user.position.title == "faculty"
	  end
end

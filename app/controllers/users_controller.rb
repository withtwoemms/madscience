class UsersController < ApplicationController

	def index
		@projects = Project.all
	end

	def show
    @user = User.find_by(id: session[:id])
    @user
  end

  def new
    if @user.is_faculty?
      render 'new'
    end
  end

  def edit
    @user
  end

  def create 
    puts "hello!"
    puts ">" * 50 + user_params
  	@new_user = User.new(user_params)
    puts ">" * 50 + @new_user

  	if position_params
  		@new_user.position = Position.find_by(title: "faculty")
  	else
  		@new_user.position = Position.find_by(title: "staff")
  	end


    if @new_user.save
      redirect_to create_sessions_path
    else
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

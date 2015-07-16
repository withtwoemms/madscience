class UsersController < ApplicationController

	def index
	end

	def show
    @show_user = User.find_by(id: params[:id])
    @projects = Project.where(creator: @show_user)
  end

  def new
    if is_faculty?
      @new_user = User.new
    else
      render_404
    end
  end

  def edit
  end

  def update
    if @user.update_attributes(user_params)
      redirect_to @user
    else
      render 'edit'
    end
  end

  def create 
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
end

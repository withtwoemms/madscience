module SessionsHelper
  def log_in(user)
    session[:id] = user.id
    if user.position == "faculty" 
  		session[:position] = user.position
  	end
  end

  def log_out
    session.delete(:id)
  end
end
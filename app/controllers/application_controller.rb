class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :set_user

  def render_404
    render :file => "#{Rails.root}/public/404", :layout => false, :status => :not_found
  end

private
  def set_user
    if session[:id]
      @user = User.find_by(id: session[:id])
    end
  end
end

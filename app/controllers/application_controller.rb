class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :logged_in?, :require_admin

  def get_browser
    @browser = Browser.new(request.env["HTTP_USER_AGENT"])
  end 

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!current_user
  end

  def require_user
    if !logged_in?
      flash[:danger] = "you must be logged in"
      redirect_to login_path
    end
  end

  def require_admin
    if logged_in? && !current_user.admin?
      flash[:danger] = "you must be an admin"
      redirect_to root_path
    end
  end

  def search_ready
    @rentals = Rental.all
    @q = Rental.ransack(params[:q])
    @rentals = @q.result(distinct: true)
  end

end

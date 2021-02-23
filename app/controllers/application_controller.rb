class ApplicationController < ActionController::Base
  # rescue_from ActiveRecord::RecordNotFound, with: :not_found
  # rescue_from Exception, with: :not_found
  rescue_from ActionController::RoutingError, with: :not_found
  helper_method :current_user

  attr_reader :current_user

  def unauthorized!
    redirect_to login_path, notice: 'You must log in'
  end

  def current_user
    @current_user ||= fetch_user(session[:user_id])
  end

  def fetch_user(id)
    User.find_by_id(id) || reset_session unless id.nil?
  end

  def raise_not_found
    raise ActionController::RoutingError.new("No route matches #{params[:unmatched_route]}")
  end

  def not_found
    respond_to do |format|
      format.html { render file: "#{Rails.root}/public/404.html", layout: false, status: :not_found }
      format.xml { head :not_found }
      format.any { head :not_found }
    end
  end

  def authenticate_user!
    if current_user.nil?
      redirect_to login_path, alert: "You must log in"
    end
  end

end

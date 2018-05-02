class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def redirect_to_root_if_logged_in
    if current_user
      flash[:notice] = 'already logged in'
      redirect_to root_path
      return
    end
  end

  def redirect_to_root_if_not_logged_in
    if !current_user
      flash[:notice] = 'not logged in yet'
      redirect_to root_path
      return
    end
  end
end

class AdminController < ApplicationController

  def log_in
    @name = current_user.name if current_user
  end

  def log_out
    session[:current_user_id] = nil
    flash[:notice] = 'you\'ve been logged out '
  end

  def create_session
    user = User.find_by(email: params[:email], password: params[:password])

    if user
      session[:current_user_id] = user.id
      flash[:notice] = 'successful log in'
      redirect_to root_path
      return
    end
    flash[:notice] = 'fail to log in'
    redirect_to action: :log_in
  end
end

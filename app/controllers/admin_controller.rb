class AdminController < ApplicationController
  # 讓log_in、create_session只有沒有登入時才進得來
  # 讓log_out只有登入時才進得來
  before_action :redirect_to_root_if_logged_in, only: [:log_in, :create_session]
  before_action :redirect_to_root_if_not_logged_in, only: [:log_out]

  def log_in
  end

  def log_out
    session[:current_user_id] = nil
    flash[:notice] = 'you\'ve been logged out '
    redirect_to root_path
    return
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

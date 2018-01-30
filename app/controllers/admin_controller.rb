class AdminController < ApplicationController

  def log_in
    # @ note = flash[:note]
     @current_user = session[:current_user]
  end

  def log_out
    session[:note] = nil
  end

  def create_session
    user = User.find_by(email: params[:email], password: params[:password])

    if user
      # session[:note] = user.name
      # 不只是名字
      # 我們想要在每一頁都可以拿到整個使用者資料
      session[:current_user] = user

    end
    redirect_to action: :log_in
  end
end

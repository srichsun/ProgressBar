class AdminController < ApplicationController

  def log_in
      current_user_id =  session[:current_user_id]
      if current_user_id
        @current_user = User.find_by_id(current_user_id)
      end
  end

  def log_out
    session[:note] = nil
  end

  def create_session
    user = User.find_by(email: params[:email], password: params[:password])

    if user
      session[:current_user_id] = user.id
    end
    redirect_to action: :log_in
  end
end

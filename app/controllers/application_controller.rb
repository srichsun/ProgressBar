class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :current_user

  def current_user
    # 如果已經有@current_user就不用一直select
    if @current_user
      return @current_user
    end
    # class AdminController < ApplicationController
    #   def action
    #     current_user.name
    #     current_user.name
    #     # class AdminController 沒死
    #     # 實例變數都會活著
    #     # 所以第二次用current_user.name
    #     # 就可以拿到 @current_user
    #   end
    # end

    current_user_id =  session[:current_user_id]
    if current_user_id
      @current_user = User.find_by_id(current_user_id)
    end
  end
end

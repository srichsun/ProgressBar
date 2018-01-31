module ApplicationHelper
  def current_user
    return @current_user
  end
end

# 在view使用helper
# 可以拿到controller得到的變數

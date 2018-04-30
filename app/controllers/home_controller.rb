class HomeController < ApplicationController

  include EvanStyle    # include module名

  def index
    @word = motivate   # 就可以用module的function
  end

  def send_email
    ProSendMailer.send_test_mail.deliver

    redirect_to root_path
  end
end

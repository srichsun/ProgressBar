class HomeController < ApplicationController
  def index
  end

  def send_email
    ProSendMailer.send_test_mail.deliver

    redirect_to root_path
  end
end

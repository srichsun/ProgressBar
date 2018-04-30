class HomeController < ApplicationController

  def index
    @EvanGirl_num = EvanGirl.number
    @word = EvanGirl.motivate
  end

  def send_email
    ProSendMailer.send_test_mail.deliver

    redirect_to root_path
  end
end

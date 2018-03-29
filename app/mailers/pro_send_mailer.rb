class ProSendMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.pro_send_mailer.send.subject
  #
  def send_test_mail
    @greeting = "Hi"

    mail to: "towparadise@gmail.com"
  end
end

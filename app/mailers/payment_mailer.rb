class PaymentMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.payment_mailer.payment_confirmation.subject
  #
  def payment_confirmation(user)
    @user = user

    mail to: user.email, subject: "Parabéns e obrigado por contratar o TrueToronto nos vemos no Canada!"
  end
end

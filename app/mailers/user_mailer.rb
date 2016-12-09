class UserMailer < ApplicationMailer
  default from: "gigomesn@gmail.com"
  layout "mailer"

  def order_confirm_mail

    mail(to: "joaocoelho93@gmail.com", subject: 'Your order details!')

  end
end

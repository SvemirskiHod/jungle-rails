class UserMailer < ApplicationMailer
  default from: "jungle@no-reply.com"
  layout "mailer"

  def order_confirm_mail(order)
    @order = order

    mail(to: "joaocoelho93@gmail.com", subject: "Confirmation for order: #{@order.id}")

  end
end
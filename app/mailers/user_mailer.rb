class UserMailer < ApplicationMailer
  def email_user(order)
    @order = order
    mail(to: @order.email, subject: 'Заказ номер №'+@order.id.to_s)
  end

  def email_admin(order)
    @email = 'admin_shop@example.com'
    @order = order
    mail(to: @email, subject: 'Поступил новый заказ')
  end

end

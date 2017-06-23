class UserCreateOrderNotifierMailer < ApplicationMailer
  def send_email order
    @order = order
    mail to: @order.guest.email,
      subject: t("admin.orders.order.success")
  end
end

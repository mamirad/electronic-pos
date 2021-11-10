class MyMailer < ApplicationMailer
  default from: "autohelpemail@gmail.com"

  def sample_email(lead)
    @lead = lead
    mail(to: @lead.email, subject: 'Verify your Email')
  end

  def receive_online_order(sale,customer)
    @sale = sale
    @customer = customer
    mail(to: 'amirad2020@gmail.com', subject: 'Online Food Order')
  end

  def send_username_password(lead)
    @lead = lead
    mail(to: @lead.email, subject: 'Change Password')
  end
end

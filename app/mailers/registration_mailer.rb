class RegistrationMailer < ApplicationMailer
  def welcome_email
    @user = params[:user]

    mail(to: @user.email, subject: 'Welcome to Library api')
  end
end

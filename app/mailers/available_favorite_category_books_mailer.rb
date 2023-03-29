class AvailableFavoriteCategoryBooksMailer < ApplicationMailer
  def recommend_email
    @user = params[:user]
    @books = params[:books]

    mail(to: @user.email, subject: 'Recommend books for you')
  end
end

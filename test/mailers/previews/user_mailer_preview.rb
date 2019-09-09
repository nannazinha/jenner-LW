# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview
  def welcome
    user = User.last
    # This is how you pass value to params[:user] inside mailer definition!
    UserMailer.with(user: user).welcome
  end
end

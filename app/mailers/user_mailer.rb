class UserMailer < ActionMailer::Base
  default from: "from@example.com"

  def rappel(validation)
    @user = validation.user;
    @url = verify_path validation.token, :only_path => false
    mail(:to => validation.user.email,
         :subject => "Welcome to My Awesome Site")
  end
end

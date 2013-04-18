class UserMailer < ActionMailer::Base
  default from: "from@example.com"

   def new_notice(user)
  	@given = @raincheck.user
  	@taken = @raincheck.user

  	mail(:to => @user.email, :subject => "You have just received a raincheck.")
  end

end

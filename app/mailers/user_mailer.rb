class UserMailer < ActionMailer::Base
  default from: "from@example.com"

   def new_notice(user, raincheck, password)
   	@taker = user
  	@raincheck = raincheck
  	@given = @raincheck.giver
  	@password = password

  	mail(:to => @taker.email, :subject => "You have just received a raincheck.")
  end

end

class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :new_raincheck

  def new_raincheck
  	if current_user
			@new_raincheck = current_user.given_rainchecks.build
			@new_raincheck.takers.build
		else
			@new_raincheck = Raincheck.new
		end
	end
end

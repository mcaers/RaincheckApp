class TakersController < ApplicationController
  before_filter :require_raincheck


  def create
  	@taker = User.where(:email => params[:user][:email]).first_or_initialize params[:user]
  	password = @taker.generate_password if @taker.encrypted_password == ""
  	@raincheck_user = @raincheck.raincheck_users.build :user => @taker

  	if @taker.save && @raincheck_user.save
  		UserMailer.new_notice(@taker, @raincheck, password).deliver
  		redirect_to rainchecks_path
  	else
  		render :new
  	end
  end

  def new
  	@taker = User.new
  end

  def require_raincheck
  	@raincheck = current_user.given_rainchecks.find params[:raincheck_id]
  end

end

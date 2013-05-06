class RainchecksController < ApplicationController
  
  before_filter :authenticate_user!
  before_filter :require_raincheck, except: [:index, :new, :create, :masterlist]

	def index
		@given = current_user.given_rainchecks.order('rainchecks.created_at DESC').where :completed => false
		@taken = current_user.taken_rainchecks.order('rainchecks.created_at DESC').where :completed => false
	end

	def edit
	end

	def show
		@raincheck = Raincheck.find(params[:id])
		@given = @raincheck.giver
	end

	def update
		if @raincheck.update_attributes params[:raincheck]
		  redirect_to [:rainchecks], notice: "Raincheck updated!"
		else
		  render :edit
		end
	end

	def create
		@raincheck = current_user.given_rainchecks.build params[:raincheck]
		if @raincheck.save
		  redirect_to [:rainchecks], notice: "Raincheck created!"
		else
		  render :new
		end
	end

	def destroy
		@raincheck.destroy
		redirect_to [:rainchecks], notice: "Raincheck deleted!"
	end

	def complete
		@raincheck = Raincheck.find(params[:id])
		if @raincheck.completed == false
			@raincheck.completed = true
			@raincheck.save
			  redirect_to [:rainchecks], notice: "Raincheck archived!"
		end
	end

	def masterlist
		@given = current_user.given_rainchecks.order('rainchecks.created_at DESC')
		@taken = current_user.taken_rainchecks.order('rainchecks.created_at DESC')
	end



	protected

	def require_raincheck
		@raincheck = current_user.given_rainchecks.find params[:id]
	end

	def nav_state
		@nav = :rainchecks
	end
  
end



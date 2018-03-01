class ReservationsController < ApplicationController
	before_action :require_login

	def index
		@reservations = Reservation.all
		@listings = Listing.all
	end
 
	def new
		@listing = Listing.find(params[:listing_id])
		@reservation = Reservation.new
	end

	def create
		@listing = Listing.find(params[:listing_id])
		@reservation = current_user.reservations.new(reservation_params)
		@reservation.listing_id = @listing.id
		  if @reservation.save
		  	ReservationJob.perform_later(current_user, @listing.id, @reservation)
		  	redirect_to [@listing, @reservation]
		  else
		  	render "new"
		  end
		  	
	end

	def show
		@listing = Listing.find(params[:listing_id])
		@reservation = Reservation.find(params[:id])
	end

	def destroy
		@listing = Listing.find(params[:listing_id])
		@reservation = Reservation.find(params[:id])
			if @reservation.destroy
				redirect_to [@listing, @reservation]
			end
		end

	private
		
		def reservation_params
			params.require(:reservation).permit(:user_id, :Listing_id, :start_date, :end_date, :total_price)
		end

end
class ReservationsController < ApplicationController
	before_action :require_login

	def index
		@listing = Listing.all
		@reservations = Reservation.all
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
		  	ReservationMailer.booking_email(current_user, @listing.id, @reservation).deliver_now
		  	redirect_to [@listing, @reservation]
		  else
		  	render "new"
		  end
		  	
	end

	def show
		@listing = Listing.find(params[:listing_id])
		@reservation = Reservation.find(params[:id])
	end

	private
		
		def reservation_params
			params.require(:reservation).permit(:start_date, :end_date)
		end

end
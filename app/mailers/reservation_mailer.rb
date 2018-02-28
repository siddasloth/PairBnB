class ReservationMailer < ApplicationMailer
	

	def booking_email(customer, host, reservation)
		@customer = customer
		@host = host
		@reservation = reservation
		@url = "http://www.example.com"
		mail(to: @customer.email, subject: "Reservation with PairBnB")
	end

end

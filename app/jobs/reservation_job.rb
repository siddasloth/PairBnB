class ReservationJob < ApplicationJob
  queue_as :default

  def perform(customer, host, reservation)
    @customer = customer
    @host = host
    @reservation = reservation
    ReservationMailer.booking_email(@customer, @host, @reservation).deliver_now
  end
end

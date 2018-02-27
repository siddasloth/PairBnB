class WelcomeController < ApplicationController

	def index
		
	end

	def search
		@listings = Listing.all
		if params[:search]
			@listings = Listing.find_by_location(params[:search])
		else
			@listings = Listing.all
		end
	end
end
class ListingsController < ApplicationController
	before_action :require_login, only: [:create, :edit, :update]

	def index
		@listings = Listing.all
	end
	

	def new
		@listing = Listing.new
	end

	def create
		@listing = current_user.listings.new(listing_params)
		if @listing.save
			redirect_to root_path
		else
			render 'new'
		end
	end

	def edit
		@listing = current_user.listings.find(params[:id])
	end

	def update
		@listing = current_user.listings.find(params[:id])
		if @listing.update(listing_params)
			redirect_to listings_path 
		else 
			redirect_to root_path
		end
	end

	def destroy
		@listing = current_user.listings.find(params[:id])
		if @listing.destroy
			redirect_to listings_path
		end
	end


	private

	def listing_params
		params.require(:listing).permit(:title, :description, :location, :bedroom, :bathroom, :accomodate, :entire_home, {amenities: []}, :user_id, {images: []})
	end

end





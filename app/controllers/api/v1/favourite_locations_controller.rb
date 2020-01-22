class Api::V1::FavouriteLocationsController < ApplicationController

    def index
        user_id = params[:user_id]
        locations = FavouriteLocation.where("user_id=#{user_id}")
        render json: locations
    end

    def create
        puts "params"
        puts params
        @location = FavouriteLocation.new(post_params)
      if @location.valid?
        @location.save()
        render json: {message: 'Created'}
      else
        render json: {message: 'Error'}
      end
    end

    private

	def post_params
		params.require(:favourite_location).permit(:user_id, :latitude, :longitude, :area, :state)
    end

end
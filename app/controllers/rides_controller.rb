class RidesController < ApplicationController

    def new
        @ride = Ride.create(user_id: session[:user_id], attraction_id: params[:id])
        @result = @ride.take_ride
        if @result.class == String
            flash[:message] = @result
        else
            flash[:message] = "Thanks for riding the #{Attraction.find(params[:id]).name}!"
        end
        redirect_to user_path(session[:user_id])
    end
end

class AttractionsController < ApplicationController

    def index
        @attractions = Attraction.all
    end

    def new
        @attraction = Attraction.new
    end

    def show
        @attraction = Attraction.find(params[:id])
    end

    def edit
        @attraction = Attraction.find(params[:id])
    end

    def create
        @attraction = Attraction.new(attraction_params)
        if @attraction.save
            redirect_to attraction_path(@attraction)
        else
            render :new
        end
    end

    def update
        @attraction = Attraction.find(params[:id])
        if @attraction.update(attraction_params)
            redirect_to attraction_path(@attraction)
        else
            render :edit
        end
    end

    private
    
    def attraction_params
        params.require(:attraction).permit(:name, :tickets, :happiness_rating, :nausea_rating, :min_height)
    end
end

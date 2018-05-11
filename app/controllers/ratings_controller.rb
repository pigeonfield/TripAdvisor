class RatingsController < ApplicationController
    
    def new
        @rating = Rating.new
    end
    
    def create
        @rating = Rating.new(rating_params)
               
        if @rating.save
            redirect_to destination_path(@destination)
        else
            render 'new'
        end  
    end
    
    private
    
    def rating_params
       params.require(:review).permit(:rating, :comment)
    end    
end

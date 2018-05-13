class RatingsController < ApplicationController
    before_action :find_destination
    
    
    def new
        @rating = Rating.new
    end
    
    def create
        @rating = Rating.new(rating_params)
        @rating.destination_id = @destination.id
        @rating.redactor_id = current_redactor.id
        
               
        if @rating.save
            redirect_to destination_path(@destination)
        else
            render 'new'
        end  
    end
    
    private
    
    def rating_params
       params.require(:rating).permit(:rating, :comment)
    end    
    
    def find_destination
        @destination = Destination.find(params[:destination_id])        
    end    
end

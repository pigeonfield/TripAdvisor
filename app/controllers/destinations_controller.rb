class DestinationsController < ApplicationController
    
    def index
        
    end    
    
    def new
        @destination = Destination.new
    end
    
    def create
        @destination = Destination.new(destination_params)
        
        if @destination.save
            redirect_to root_path
        else
            render 'new'
        end    
    end
    
    private 
    
    def destination_params
       params.require(:destination).permit(:name, :country, :description) 
    end    
end

class DestinationsController < ApplicationController
    before_action :find_destination, only: [:show, :edit, :destroy, :update]
    
    
    def index
        @destinations = Destination.all
    end    
    
    def show
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
    
    def edit
    end
    
    def update
        if @destination.update(destination_params)
            redirect_to destination_path(@destination)
        else
            render 'edit'
        end 
    end
    
    
    def destroy
        @destination.destroy
        redirect_to root_path
    end    
    
    
    private 
    
        def destination_params
           params.require(:destination).permit(:name, :country, :description) 
        end    
        
        def find_destination
            @destination = Destination.find(params[:id])        
        end    
    
end
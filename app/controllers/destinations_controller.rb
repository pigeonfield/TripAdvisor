class DestinationsController < ApplicationController
    before_action :find_destination, only: [:show, :edit, :destroy, :update]
    before_action :authenticate_redactor!, only: [:new, :edit]
    
    def index
        if params[:category].blank?
            @destinations = Destination.all.order("created_at DESC")
        else
           @category_id = Category.find_by(name: params[:category]).id
           @destinations = Destination.where(:category_id => @category_id).order("created_at DESC")
        end    
    end    
    
    def show
        if @destination.ratings.blank?
            @average_rating = 0
        else
            @average_rating = @destination.ratings.average(:rating).round(2)
        end    
    end    
    
    def new
        @destination = current_redactor.destinations.build
        @categories = Category.all.map{ |c| [c.name, c.id]}
    end
    
    def create
        @destination = current_redactor.destinations.build(destination_params)
        @destination.category_id = params[:category_id]
                
        if @destination.save
            redirect_to root_path
        else
            render 'new'
        end    
    end
    
    def edit
        @categories = Category.all.map{ |c| [c.name, c.id]}
    end
    
    def update
        @destination.category_id = params[:category_id]
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
           params.require(:destination).permit(:name, :country, :description, :category_id, :destination_img) 
        end    
        
        def find_destination
            @destination = Destination.find(params[:id])        
        end    
    
end
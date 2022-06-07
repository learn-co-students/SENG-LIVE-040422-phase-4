class ProductionsController < ApplicationController
    
    # GET "/productions"
    def index 
        render json: Production.all
    end 

    # GET "/productions/:id"
    def show
        production = Production.find(params[:id])
        render json: production, include: :production_roles
    end

    # GROUP ACTIVITY #1
    # POST /productions
    def create
        # byebug
        
        # Add Code to Check Whether Processable Entity
        # create = new + save
        production = Production.create(production_params)
        
        # If Yes, Return New Production in JSON Format With Status of Created
        render json: production, status: :created

        # If No, Return Errors With Status of Unprocessable Entity
    end

    private

    # GROUP ACTIVITY #1
    def production_params
        # Add Strong Params for Each New Production
        params.permit(:title, :genre, :description, :budget, :image, :director, :ongoing)
    end
end

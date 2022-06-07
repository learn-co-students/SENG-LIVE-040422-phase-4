class ProductionRolesController < ApplicationController

    # "/production_roles"
    def index 
        render json: ProductionRole.all
    end 

    # "/production_roles/:id"
    def show
        production_role = ProductionRole.find(params[:id])
        render json: production_role, include: :production
    end

    # GROUP ACTIVITY #1
    # POST "/production_roles"
    def create
        production_role = ProductionRole.create!(production_role_params)
        render json: production_role, status: :created
    end

    private

    # GROUP ACTIVITY #1
    def production_role_params
        # Add Strong Params for Each New Production Role
        params.permit(:role, :understudy, :production_id)
    end
end

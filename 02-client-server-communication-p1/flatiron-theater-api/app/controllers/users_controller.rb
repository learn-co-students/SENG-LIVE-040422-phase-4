class UsersController < ApplicationController
    
    # "/users"
    def index 
        render json: User.all
    end 

    # "/users/:id"
    def show
        user = User.find(params[:id])
        render json: user, include: :tickets
    end
    
    # GROUP ACTIVITY #1
    def create
        user = User.create!(user_params)
        render json: user, status: :created
    end

    private

    # GROUP ACTIVITY #1
    def user_params
        # Add Strong Params for Each New User
        params.permit(:name, :admin)
    end
end
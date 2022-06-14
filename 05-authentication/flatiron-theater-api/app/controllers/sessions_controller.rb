class SessionsController < ApplicationController
    # Group Activity => Add Action (sessions#login) To Handle Login
    
    def login
        byebug
        
        # Show, Destroy, Update => Finding Resource by ID
            # user = User.find(params[:id])
        # Find User via "username" params
        
        # Triggers a RecordNotFound Exception
        user = User.find_by!(name: params[:username])
        
        # If User exists / authenticates, render "user" as JSON with "status: :ok"
        if user&.authenticate(params[:password])
            # render json: user
            render json: { user: "Welcome to the Flatiron Theater API!" }, status: :ok
        else
            # If User does not authenticate, render "Invalid Password or Username" with "status: :unprocessable_entity"
            render json: { errors: "Invalid Password or Username" }, status: :unprocessable_entity
        end
    end
end

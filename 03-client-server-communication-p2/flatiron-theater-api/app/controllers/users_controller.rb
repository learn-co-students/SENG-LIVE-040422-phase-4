class UsersController < ApplicationController
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response

    # GET "/users"
    def index 
        render json: User.all
    end 

    # GET "/users/:id"
    def show
        user = User.find(params[:id])
        render json: user, include: :tickets
    end
    
    # POST "/users"
    def create
        user = User.create!(user_params)
        render json: user, status: :created
    end

    # GROUP ACTIVITY => Add Update / Destroy Actions

    # PUT "/users/:id"
    def update
        user = User.find(params[:id])
        user.update!(user_params)
        render json: user, status: :created
    end

    # DELETE "/users/:id"
    def destroy
        user = User.find(params[:id])
        user.destroy
        head :no_content
        # render json: user
    end

    private

    def user_params
        params.permit(:name, :admin)
    end

    def render_unprocessable_entity_response(invalid)
        render json: { errors: invalid.record.errors }, status: :unprocessable_entity
    end
end
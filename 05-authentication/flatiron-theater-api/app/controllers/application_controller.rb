class ApplicationController < ActionController::API
    # Configure Rails to Use Cookies & Sessions
    include ActionController::Cookies
    
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

    private
    
    # function declarations => parameters
    # function invocations => arguments
    def render_unprocessable_entity_response(invalid)        
        render json: { errors: invalid.record.errors }, status: :unprocessable_entity
    end

    def render_not_found_response(invalid)
        render json: { errors: invalid }, status: :not_found
    end
end

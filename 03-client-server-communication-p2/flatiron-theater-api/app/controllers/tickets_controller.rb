class TicketsController < ApplicationController
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response

    # GET "/tickets"
    def index 
        render json: Ticket.all
    end 

    # GET "/tickets/:id"
    def show
        ticket = Ticket.find(params[:id])
        render json: ticket, include: [:production, :user]
    end 

    # POST "/tickets"
    def create
        ticket = Ticket.create!(ticket_params)
        render json: ticket, status: :created
    end

    # GROUP ACTIVITY => Add Update / Destroy Actions

    # PUT "/tickets/:id"
    def update
        ticket = Ticket.find(params[:id])
        ticket.update!(ticket_params)
        render json: ticket, status: :created
    end

    # DELETE "/tickets/:id"
    def destroy
        ticket = Ticket.find(params[:id])
        ticket.destroy
        head :no_content
    end

    private

    def ticket_params
        params.permit(:price, :user_id, :production_id)
    end

    def render_unprocessable_entity_response(invalid)
        render json: { errors: invalid.record.errors }, status: :unprocessable_entity
    end
end
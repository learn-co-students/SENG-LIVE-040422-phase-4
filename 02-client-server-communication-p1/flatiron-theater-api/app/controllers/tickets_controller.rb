class TicketsController < ApplicationController
    
    # "/tickets"
    def index 
        render json: Ticket.all
    end 

    # "/tickets/:id"
    def show
        ticket = Ticket.find(params[:id])
        render json: ticket, include: [:production, :user]
    end 

    # GROUP ACTIVITY #1
    def create
        ticket = Ticket.create!(ticket_params)
        render json: ticket, status: :created
    end

    private

    # GROUP ACTIVITY #1
    def ticket_params
        # Add Strong Params for Each New Ticket
        params.permit(:price, :user_id, :production_id)
    end
end
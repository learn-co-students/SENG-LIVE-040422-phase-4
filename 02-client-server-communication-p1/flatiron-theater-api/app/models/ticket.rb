class Ticket < ApplicationRecord
    belongs_to :production
    belongs_to :user

    # GROUP ACTIVITY #2
    
    # Add Validation for "price" => Must Be Any Number Greater Than Than 0
    validates :price, numericality: { greater_than: 0 }
end
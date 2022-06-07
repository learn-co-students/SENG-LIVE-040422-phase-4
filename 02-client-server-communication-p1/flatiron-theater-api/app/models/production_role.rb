class ProductionRole < ApplicationRecord
  belongs_to :production

  validates :role, presence: true
  validates :understudy, presence: true
end

class CreateTickets < ActiveRecord::Migration[6.1]
  def change
    create_table :tickets do |t|
      t.float :price
      t.belongs_to :user, foreign_key: true
      t.belongs_to :production, foreign_key: true

      t.timestamps
    end
  end
end

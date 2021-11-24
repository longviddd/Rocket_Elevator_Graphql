class CreateQuotes < ActiveRecord::Migration[5.2]
  def change
    create_table :quotes do |t|
      t.string :building_type
      t.string :amount_elevators
      t.string :product_line
      t.string :installation_fees
      t.string :total_cost
      t.string :amount_floors
      t.string :amount_basements
      t.string :amount_parking_spots
      t.string :maximum_occupancy
      t.string :amount_apartments
      t.string :amount_companies
      t.string :amount_corporations
      t.string :business_hours
      t.string :email
      t.string :company_name
      t.string :full_name
      t.string :phone

      t.timestamps
    end
  end
end

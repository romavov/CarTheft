class CreateCars < ActiveRecord::Migration
  def change
    create_table :cars do |t|
      t.string :name
      t.string :number_autos
      t.integer :year
      t.string :color
      t.string :city
      t.date :theft_date
      t.integer :telephone
      t.integer :money
      t.text :description

      t.timestamps null: false
    end
  end
end

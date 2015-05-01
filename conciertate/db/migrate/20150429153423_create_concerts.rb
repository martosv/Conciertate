class CreateConcerts < ActiveRecord::Migration
  def change
    create_table :concerts do |t|
      t.string :band
      t.string :venue
      t.string :city
      t.date :date
      t.float :price
      t.string :photo
      t.string :description
      t.string :tickets

      t.timestamps null: false
    end
  end
end
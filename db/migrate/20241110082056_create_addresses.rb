class CreateAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :addresses do |t|
      t.references :order,          null: false, foreign_key: true
      t.string :postal_code,        null: false                 
      t.integer :sender_address_id, null: false
      t.string :city,               null: false 
      t.string :street_number,      null: false
      t.string :building_name
      t.string :telephone_number,   null: false
      t.timestamps
    end
  end
end

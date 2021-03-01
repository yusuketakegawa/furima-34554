class CreateShippings < ActiveRecord::Migration[6.0]
  def change
    create_table :shippings do |t|
      t.string :address,        null:false 
      t.string :municipality,   null:false
      t.string :building,       null: false
      t.string :postal_code,     null: false
      t.string :phone_number,   null: false
      t.references :buy,        null: false
      t.integer :prefecture_id, null: false


      t.timestamps
    end
  end
end

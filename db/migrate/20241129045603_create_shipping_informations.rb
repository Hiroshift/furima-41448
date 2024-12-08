class CreateShippingInformations < ActiveRecord::Migration[7.0]
  def change
    create_table :shipping_informations do |t|
      t.string :postal_code
      t.integer :prefecture_id
      t.string :city
      t.string :house_number
      t.string :building_name
      t.string :phone_number
      t.references :order, null: false, foreign_key: true

      t.timestamps
    end
  end
end

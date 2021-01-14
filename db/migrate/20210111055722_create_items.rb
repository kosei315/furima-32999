class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :product_name,           null: false
      t.integer :category_id ,          null: false
      t.integer :price,                 null: false
      t.text :product_description,      null: false
      t.integer :product_condition_id,  null: false
      t.integer :shipping_charges_id,   null: false
      t.integer :delivery_area_id,      null: false
      t.integer :data_of_shipment_id,   null: false
      t.references :user,               null: false
      t.timestamps
    end
  end
end
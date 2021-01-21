class CreateSerects < ActiveRecord::Migration[6.0]
  def change
    create_table :serects do |t|
      t.string     :postal_code,    null: false
      t.integer    :delivery_area_id, null: false
      t.string     :municipality,   null: false
      t.string     :address,        null: false
      t.string     :building_name,  null: false
      t.string     :phone_number,   null: false
      t.references :personal,       null: false
      t.timestamps
    end
  end
end
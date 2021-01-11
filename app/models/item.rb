class Item < ApplicationRecord
    belongs_to :user
    has_one    :personal


    with_options presence: true do
      validates :product_name
      validates :category_id
      validates :price
      validates :product_description
      validates :product_condition_id
      validates :shipping_charges_id
      validates :delivery_area_id
      validates :data_of_shipment_id
      validates :user,foreign_key: true
    end
end

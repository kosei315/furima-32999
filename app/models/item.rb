class Item < ApplicationRecord
    belongs_to :user
    has_one_attached :personal
    has_one_attached :image

    extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to :category
    belongs_to :data_of_shipment
    belongs_to :delivery_area
    belongs_to :product_condition
    belongs_to :shipping_charge

    with_options presence: true do
      validates :product_name
      validates :price , format: {with: /\A[0-9]+\z/}
      validates :price, numericality: { greater_than_or_equal_to: 333 ,less_than_or_equal_to: 9999999}
      validates :product_description
      validates :image
    end

    

    with_options numericality: { other_than: 1 } do
      validates :category_id
      validates :product_condition_id
      validates :shipping_charges_id
      validates :delivery_area_id
      validates :data_of_shipment_id
    end
end

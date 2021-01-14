FactoryBot.define do
  factory :item do
    product_name         {"商品名"}
    category_id             {2}
    price                {333}
    product_description  {"商品説明"}
    product_condition_id    {3}
    shipping_charges_id     {4}
    delivery_area_id        {5}
    data_of_shipment_id     {2}
    
    association :user
    
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/omuretu.png'), filename: 'omuretu.png')
    end

  end
end
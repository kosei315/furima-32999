class PersonalSerect
  include ActiveModel::Model
  attr_accessor :postal_code,:delivery_area_id,:municipality,:address,:building_name,:phone_number,:user_id,:item_id,:token

  
  with_options presence: true do
    validates :postal_code, format: {with: /\A\d{3}[-]\d{4}\z/}
    validates :municipality
    validates :address
    validates :phone_number, format: {with: /\A\d{11}\z/}
    validates :token
    validates :user_id
    validates :item_id
  end
  with_options numericality: { other_than: 1 } do
    validates :delivery_area_id
  end

  def save
    personal = Personal.create(user_id: user_id.id,item_id: item_id)
    Serect.create(postal_code: postal_code,delivery_area_id: delivery_area_id,municipality: municipality,address: address,building_name: building_name,phone_number: phone_number,personal_id: personal.id)
  end
end
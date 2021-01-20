FactoryBot.define do
  factory :personal_serect do
    postal_code        {"111-1111"}
    municipality       {"横浜市"}
    address            {"1-1"}
    phone_number       {"09011111111"}
    delivery_area_id   {5}
    user_id            {3}
    item_id            {8}
    token {"tok_abcdefghijk00000000000000000"}
  end
end
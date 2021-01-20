class Personal < ApplicationRecord
  belongs_to :user
  belongs_to :item
  has_one :serect
end

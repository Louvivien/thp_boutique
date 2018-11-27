class Item < ApplicationRecord
  #belongs_to: panier
   validates :title,
   presence: true,
   length: {maximum: 100},
   on: :create,
   allow_nil: false

   validates :description,
   presence: true,
   length: {maximum: 500},
   on: :create,
   allow_nil: false

   validates :price,
   presence: true,
   length: {maximum: 5},
   on: :create,
   allow_nil: false

   validates :image_url,
   presence: true,
   on: :create,
   allow_nil: false
end

class Panier < ApplicationRecord
	has_many :items
	belongs_to :user
end

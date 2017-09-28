class Address < ApplicationRecord
	belongs_to :user
	belongs_to :locality
end

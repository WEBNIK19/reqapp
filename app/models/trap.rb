class Trap < ApplicationRecord
	has_many :requests, dependent: :destroy
end
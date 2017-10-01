class Party < ApplicationRecord
	has_many :users_parties
	has_many :users, :through => :users_parties
	has_many :santa_organizers
end

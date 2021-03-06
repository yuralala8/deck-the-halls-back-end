class User < ApplicationRecord
	has_secure_password
	validates :username, presence: true, uniqueness: true

	has_many :wishes
	has_many :friendships
	has_many :friends, :through => :friendships
	has_many :users_parties
	has_many :parties, :through => :users_parties
end

class Strategist < ApplicationRecord
    has_many :accounts
    has_many :users, through: :accounts

    validates :name, :location, presence: true

end